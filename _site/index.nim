import nimja/parser
import os, sugar, print
import strutils


proc myRenderProc(): string =
  # var files = [(filename: "cat"),
  #              (filename: "dog"),
  # ]

  let files = collect(newSeq):
    for file in walkFiles(getScriptDir() / "pdf" / "*"):
      (fullpath: file, name: file.split("/")[1])

  print files
  compileTemplateFile(getScriptDir() / "index.nimja")

writeFile("index.html", myRenderProc())
