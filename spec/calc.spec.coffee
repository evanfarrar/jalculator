parser = require("../calc").parser
describe "calculator", () ->
  it "is successful", () ->
    expect(parser.parse("2^32 / 1024")).toEqual(4194304)
