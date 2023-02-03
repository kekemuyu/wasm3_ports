package ui

import (
	"../function"
	"github.com/ying32/govcl/vcl"
)

// ::private::
type TFrmMainFields struct {
}

func (f *TFrmMain) OnFormCreate(sender vcl.IObject) {

}

func (f *TFrmMain) OnLabel3Click(sender vcl.IObject) {

}

func (f *TFrmMain) OnButton1Click(sender vcl.IObject) {
	gocode := function.NewGo(f.LabeledEdit1.Text(), f.LabeledEdit2.Text())
	re := gocode.Gen(f.Memo4.Text(), f.Memo5.Text())
	for _, v := range re {
		f.Memo3.Lines().Add(v)
	}
}

func (f *TFrmMain) OnButton2Click(sender vcl.IObject) {
	f.LabeledEdit1.Clear()
	f.LabeledEdit2.Clear()
	f.ComboBox1.SetItemIndex(0)
}
