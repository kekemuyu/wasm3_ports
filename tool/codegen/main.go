// Automatically generated by the res2go IDE plug-in.
package main

import (
    "github.com/ying32/govcl/vcl"
    "./code"
)

func main() {
    vcl.Application.SetScaled(true)
    vcl.Application.SetTitle("codegen")
    vcl.Application.Initialize()
    vcl.Application.SetMainFormOnTaskBar(true)
    vcl.Application.CreateForm(&code.FrmMain)
    vcl.Application.Run()
}