#!/usr/local/bin/io
# 给定 slot 名称，执行 slot 代码
MyObject := Object clone

someSlot := method(writeln("called someSlot of MyObject!"))

MyObject ::= someSlot

MyObject getSlot("someSlot")