import { $ } from "zx";
import chalk from "chalk";

let stdOutput;
let testSuitePass = false;
let errorMessage = "";

const parseErrorMsg = msg => {
  // file + line + characters
  const errorPosRegex = new RegExp(
    'File "(.+)", line ([0-9]+), characters ([0-9-]+):'
  );
  const errorPosMatch = msg.match(errorPosRegex);
  if (errorPosMatch) {
    const [match, path, line, chars] = errorPosMatch;
    return `In file "${path}, line ${line}, characters ${chars}": ${msg
      .replace(/\n/g, "")
      .replace(match, "")}`;
  }

  return msg;
};

const startTime = performance.now();
try {
  const output = await $`ligo run test tests/tests.mligo`;
  stdOutput = output.stdout;
  testSuitePass = true;
} catch (error) {
  //console.error(error);
  errorMessage = error.stderr;
  stdOutput = error.stdout;
}
const endTime = performance.now();

// parses Ligo output
let testCount = 0;
let testOutputs = [];
stdOutput.split("\n").forEach(test => {
  testCount += 1;

  // tests
  const regexTest = new RegExp('"([+-]{3,}) (.*) => (.*)"');
  const testMatch = test.match(regexTest);
  if (testMatch) {
    const testOutput = {
      type: "test",
      pass: testMatch[1] === "+++",
      testName: testMatch[2],
      message: testMatch[3]
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
            output.pass ? "" : "(" + chalk.red(output.message) + ")"
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
  console.log(chalk.green.inverse("Test suite passed"));
  console.log("- Number of tests: ", testCount);
} else {
  console.log(chalk.red.inverse("Test suite failed"));
  if (errorMessage) {
    console.log(chalk.red(parseErrorMsg(errorMessage)));
  }
  console.log("- Number of passing tests before fail: ", testCount);
}
console.log(`- Tests executed in ${Math.round(endTime - startTime)} ms`);
