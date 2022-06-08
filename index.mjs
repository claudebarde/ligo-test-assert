import { $ } from "zx";
import chalk from "chalk";

let stdOutput;
let stdErr;
let testSuitePass = false;

if (process.argv.length < 3) {
  throw chalk.red(
    "Error: missing argument to run the tests. Check if you specified the path to the file to test"
  );
}

const findErrLocation = errMsg => {
  const simpleErrRegex =
    /"([a-zA-Z\/\.\-]+.test.mligo)", line ([0-9\-]+), characters ([0-9\-]+)/;
  const simpleMatch = errMsg.match(simpleErrRegex);
  if (simpleMatch) {
    return `Failed assertion in file ${simpleMatch[1]}, line ${simpleMatch[2]}, characters ${simpleMatch[3]}`;
  } else {
    const complexErrRegex =
      /"([a-zA-Z\/\.\-]+.test.mligo)", line ([0-9]+), character ([0-9]+) to line ([0-9]+), character ([0-9]+)/;
    const complexMatch = errMsg.match(complexErrRegex);
    if (complexMatch) {
      return `Failed assertion in file ${complexMatch[1]}, line ${complexMatch[2]}, character ${complexMatch[3]} to line ${complexMatch[4]}, character ${complexMatch[5]}`;
    }
  }

  return "Unknown error location";
};

const startTime = performance.now();
try {
  const output = await $`ligo run test ${process.argv[2]}`;
  stdOutput = output.stdout;
  testSuitePass = true;
} catch (error) {
  // console.error(error);
  stdOutput = error.stdout;
  stdErr = error.stderr;
}
const endTime = performance.now();

// parses Ligo output
let testCount = 0;
let testOutputs = [];
stdOutput.split("\n").forEach(test => {
  console.log("test:", test);
  testCount += 1;

  // successful tests without message
  const regexSuccessTest = new RegExp('"(\\+{3,}) (.*) => (.*)"');
  const successMatch = test.match(regexSuccessTest);
  if (successMatch) {
    const testOutput = {
      type: "test",
      pass: true,
      testName: successMatch[2],
      message: successMatch[3]
    };
    testOutputs.push(testOutput);
  }
  // successful tests with message
  const regexSuccessTestWithMsg = new RegExp(
    '"(\\+{3,}) (.*) successful \\((.*)\\)"'
  );
  const successMatchWithMsg = test.match(regexSuccessTestWithMsg);
  if (successMatchWithMsg) {
    const testOutput = {
      type: "test",
      pass: true,
      testName: successMatchWithMsg[2],
      message: successMatchWithMsg[3]
    };
    testOutputs.push(testOutput);
  }
  // failed tests
  const regexFailedTest = new RegExp(
    '"(-{3}) (.*) => assertion failed \\((.*)\\)"'
  );
  const failMatch = test.match(regexFailedTest);
  if (failMatch) {
    const testOutput = {
      type: "test",
      pass: false,
      testName: failMatch[2],
      message: failMatch[3]
    };
    testOutputs.push(testOutput);
  }
  // user titles
  const regexTitle = new RegExp("[=]{5,} (.*) [=]{5,}");
  const titleMatch = test.match(regexTitle);
  if (titleMatch) {
    const testOutput = {
      type: "title",
      title: titleMatch[1]
    };
    testOutputs.push(testOutput);
  }
});
if (testOutputs.length > 0) {
  console.log("\n\n");
  console.log(
    testOutputs
      .map(output => {
        if (output.type === "test") {
          return `${
            output.pass ? chalk.green("PASS ") : chalk.red("FAIL ")
          } - ${output.testName} ${
            output.pass
              ? "\n\t Passed with message: " +
                chalk.cyan('"' + output.message + '"')
              : "(" + chalk.red(output.message) + ")"
          }`;
        } else if (output.type === "title") {
          return chalk.blue("\n   " + output.title + "\n");
        }
      })
      .join("\n")
  );
}
console.log("\r");
if (testSuitePass) {
  console.log(chalk.green("Test suite passed"));
  console.log("- Number of tests: ", testCount);
} else {
  console.log(chalk.red("Test suite failed"));
  console.error(chalk.red(findErrLocation(stdErr)));
  console.log("- Number of passing tests before fail: ", testCount);
}
console.log(`- Tests executed in ${Math.round(endTime - startTime)} ms`);
