// Automatically generated by the res2go IDE plug-in, do not edit.
package ui

import (
    "github.com/ying32/govcl/vcl"
)

type TFrmMain struct {
    *vcl.TForm
    ComboBox1    *vcl.TComboBox
    Memo1        *vcl.TMemo
    Memo2        *vcl.TMemo
    Memo3        *vcl.TMemo
    LabeledEdit1 *vcl.TLabeledEdit
    Label1       *vcl.TLabel
    LabeledEdit2 *vcl.TLabeledEdit
    Label2       *vcl.TLabel
    Label3       *vcl.TLabel
    Memo4        *vcl.TMemo
    Label4       *vcl.TLabel `events:"OnLabel3Click"`
    Memo5        *vcl.TMemo
    Label5       *vcl.TLabel
    Label6       *vcl.TLabel
    Button1      *vcl.TButton
    Button2      *vcl.TButton

    //::private::
    TFrmMainFields
}

var FrmMain *TFrmMain




// vcl.Application.CreateForm(&FrmMain)

func NewFrmMain(owner vcl.IComponent) (root *TFrmMain)  {
    vcl.CreateResForm(owner, &root)
    return
}

var frmMainBytes = []byte("\x54\x50\x46\x30\x08\x54\x46\x72\x6D\x4D\x61\x69\x6E\x07\x46\x72\x6D\x4D\x61\x69\x6E\x04\x4C\x65\x66\x74\x03\x76\x01\x06\x48\x65\x69\x67\x68\x74\x03\xF0\x04\x03\x54\x6F\x70\x03\x97\x00\x05\x57\x69\x64\x74\x68\x03\x43\x08\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x07\x46\x72\x6D\x4D\x61\x69\x6E\x0C\x43\x6C\x69\x65\x6E\x74\x48\x65\x69\x67\x68\x74\x03\xF0\x04\x0B\x43\x6C\x69\x65\x6E\x74\x57\x69\x64\x74\x68\x03\x43\x08\x0D\x44\x65\x73\x69\x67\x6E\x54\x69\x6D\x65\x50\x50\x49\x03\x90\x00\x0A\x4C\x43\x4C\x56\x65\x72\x73\x69\x6F\x6E\x06\x07\x32\x2E\x32\x2E\x34\x2E\x30\x00\x09\x54\x43\x6F\x6D\x62\x6F\x42\x6F\x78\x09\x43\x6F\x6D\x62\x6F\x42\x6F\x78\x31\x04\x4C\x65\x66\x74\x03\xA8\x00\x06\x48\x65\x69\x67\x68\x74\x02\x20\x03\x54\x6F\x70\x02\x20\x05\x57\x69\x64\x74\x68\x03\xA6\x00\x0A\x49\x74\x65\x6D\x48\x65\x69\x67\x68\x74\x02\x18\x09\x49\x74\x65\x6D\x49\x6E\x64\x65\x78\x02\x00\x0D\x49\x74\x65\x6D\x73\x2E\x53\x74\x72\x69\x6E\x67\x73\x01\x06\x15\xE6\x9C\x89\xE5\x8F\x82\xE6\x95\xB0\xE6\x9C\x89\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x06\x15\xE6\x9C\x89\xE5\x8F\x82\xE6\x95\xB0\xE6\x97\xA0\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x06\x15\xE6\x97\xA0\xE5\x8F\x82\xE6\x95\xB0\xE6\x9C\x89\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x06\x15\xE6\x97\xA0\xE5\x8F\x82\xE6\x95\xB0\xE6\x97\xA0\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x00\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x00\x04\x54\x65\x78\x74\x06\x15\xE6\x9C\x89\xE5\x8F\x82\xE6\x95\xB0\xE6\x9C\x89\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x00\x00\x05\x54\x4D\x65\x6D\x6F\x05\x4D\x65\x6D\x6F\x31\x04\x4C\x65\x66\x74\x02\x4B\x06\x48\x65\x69\x67\x68\x74\x03\xF7\x01\x03\x54\x6F\x70\x03\xB8\x02\x05\x57\x69\x64\x74\x68\x03\xED\x01\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x01\x00\x00\x05\x54\x4D\x65\x6D\x6F\x05\x4D\x65\x6D\x6F\x32\x04\x4C\x65\x66\x74\x03\x88\x02\x06\x48\x65\x69\x67\x68\x74\x03\x57\x04\x03\x54\x6F\x70\x02\x50\x05\x57\x69\x64\x74\x68\x03\x28\x02\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x02\x00\x00\x05\x54\x4D\x65\x6D\x6F\x05\x4D\x65\x6D\x6F\x33\x04\x4C\x65\x66\x74\x03\x08\x05\x06\x48\x65\x69\x67\x68\x74\x03\x56\x04\x03\x54\x6F\x70\x02\x50\x05\x57\x69\x64\x74\x68\x03\x3D\x02\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x03\x00\x00\x0C\x54\x4C\x61\x62\x65\x6C\x65\x64\x45\x64\x69\x74\x0C\x4C\x61\x62\x65\x6C\x65\x64\x45\x64\x69\x74\x31\x04\x4C\x65\x66\x74\x03\xA8\x00\x06\x48\x65\x69\x67\x68\x74\x02\x20\x03\x54\x6F\x70\x02\x50\x05\x57\x69\x64\x74\x68\x02\x78\x10\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x48\x65\x69\x67\x68\x74\x02\x18\x0F\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x57\x69\x64\x74\x68\x02\x48\x11\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x43\x61\x70\x74\x69\x6F\x6E\x06\x0C\xE5\xBA\x93\xE5\x90\x8D\xE7\xA7\xB0\xEF\xBC\x9A\x15\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x0D\x4C\x61\x62\x65\x6C\x50\x6F\x73\x69\x74\x69\x6F\x6E\x07\x06\x6C\x70\x4C\x65\x66\x74\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x04\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x31\x04\x4C\x65\x66\x74\x02\x40\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x02\x28\x05\x57\x69\x64\x74\x68\x02\x5A\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x0F\xE5\x87\xBD\xE6\x95\xB0\xE7\xB1\xBB\xE5\x9E\x8B\xEF\xBC\x9A\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x0C\x54\x4C\x61\x62\x65\x6C\x65\x64\x45\x64\x69\x74\x0C\x4C\x61\x62\x65\x6C\x65\x64\x45\x64\x69\x74\x32\x04\x4C\x65\x66\x74\x03\xA8\x00\x06\x48\x65\x69\x67\x68\x74\x02\x20\x03\x54\x6F\x70\x03\x80\x00\x05\x57\x69\x64\x74\x68\x02\x78\x10\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x48\x65\x69\x67\x68\x74\x02\x18\x0F\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x57\x69\x64\x74\x68\x02\x7E\x11\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x43\x61\x70\x74\x69\x6F\x6E\x06\x15\xE5\xBA\x93\xE4\xB8\xAD\xE5\x87\xBD\xE6\x95\xB0\xE5\x90\x8D\xE7\xA7\xB0\xEF\xBC\x9A\x15\x45\x64\x69\x74\x4C\x61\x62\x65\x6C\x2E\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x0D\x4C\x61\x62\x65\x6C\x50\x6F\x73\x69\x74\x69\x6F\x6E\x07\x06\x6C\x70\x4C\x65\x66\x74\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x05\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x32\x04\x4C\x65\x66\x74\x02\x58\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x03\x90\x02\x05\x57\x69\x64\x74\x68\x02\x36\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x09\xE5\x87\xBD\xE6\x95\xB0\xE4\xBD\x93\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x33\x04\x4C\x65\x66\x74\x02\x58\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x03\xC8\x00\x05\x57\x69\x64\x74\x68\x02\x48\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x0C\xE5\x87\xBD\xE6\x95\xB0\xE5\x8F\x82\xE6\x95\xB0\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x05\x54\x4D\x65\x6D\x6F\x05\x4D\x65\x6D\x6F\x34\x04\x4C\x65\x66\x74\x02\x55\x06\x48\x65\x69\x67\x68\x74\x03\x90\x00\x03\x54\x6F\x70\x03\xE8\x00\x05\x57\x69\x64\x74\x68\x03\xE3\x01\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x06\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x34\x04\x4C\x65\x66\x74\x02\x55\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x03\x88\x01\x05\x57\x69\x64\x74\x68\x02\x5A\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x0F\xE5\x87\xBD\xE6\x95\xB0\xE8\xBF\x94\xE5\x9B\x9E\xE5\x80\xBC\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x05\x54\x4D\x65\x6D\x6F\x05\x4D\x65\x6D\x6F\x35\x04\x4C\x65\x66\x74\x02\x50\x06\x48\x65\x69\x67\x68\x74\x03\x90\x00\x03\x54\x6F\x70\x03\xA8\x01\x05\x57\x69\x64\x74\x68\x03\xE8\x01\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x07\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x35\x04\x4C\x65\x66\x74\x03\x98\x02\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x02\x28\x05\x57\x69\x64\x74\x68\x02\x43\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x07\x61\x72\x64\x75\x69\x6E\x6F\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x06\x54\x4C\x61\x62\x65\x6C\x06\x4C\x61\x62\x65\x6C\x36\x04\x4C\x65\x66\x74\x03\x10\x05\x06\x48\x65\x69\x67\x68\x74\x02\x18\x03\x54\x6F\x70\x02\x28\x05\x57\x69\x64\x74\x68\x02\x17\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x02\x67\x6F\x0B\x50\x61\x72\x65\x6E\x74\x43\x6F\x6C\x6F\x72\x08\x00\x00\x07\x54\x42\x75\x74\x74\x6F\x6E\x07\x42\x75\x74\x74\x6F\x6E\x31\x04\x4C\x65\x66\x74\x03\x70\x01\x06\x48\x65\x69\x67\x68\x74\x02\x26\x03\x54\x6F\x70\x02\x78\x05\x57\x69\x64\x74\x68\x02\x71\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x06\xE7\x94\x9F\xE6\x88\x90\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x08\x00\x00\x07\x54\x42\x75\x74\x74\x6F\x6E\x07\x42\x75\x74\x74\x6F\x6E\x32\x04\x4C\x65\x66\x74\x03\x70\x01\x06\x48\x65\x69\x67\x68\x74\x02\x26\x03\x54\x6F\x70\x02\x40\x05\x57\x69\x64\x74\x68\x02\x71\x07\x43\x61\x70\x74\x69\x6F\x6E\x06\x06\xE6\xB8\x85\xE9\x99\xA4\x08\x54\x61\x62\x4F\x72\x64\x65\x72\x02\x09\x00\x00\x00")

// Register Form Resources
var _ = vcl.RegisterFormResource(FrmMain, &frmMainBytes)
