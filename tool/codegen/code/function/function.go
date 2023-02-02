package function

import (
	"errors"
	"strings"
)

type Cfunc struct {
}

type Gofunc struct {
	PakName  string
	FuncName string
}

func NewGo(packname, funcname string) *Gofunc {
	var gofunc Gofunc
	gofunc.PakName = packname
	gofunc.FuncName = funcname
	return &gofunc
}

// func getSecond() uint
//
//go:wasm-module rtc
//go:export getSecond
func (t *Gofunc) Gen(params string, reval string) []string {
	re := make([]string, 0)
	templine := "//go:wasm-module " + t.PakName
	re = append(re, templine)
	templine = "//go:wasm-export " + t.FuncName
	re = append(re, templine)
	templine = "func " + t.FuncName + "(" + paramToGoStyle + ") " + ctypeToGoType(reval)
	re = append(re, templine)
	return re
}

func paramToGoStyle(params string) (string, error) {
	var re string
	if len(params) == 0 {
		return "", errors.New("null")
	}
	list := strings.Split(params, ",")

	if len(list) == 0 {
		return "", errors.New("null")
	}
	for _, v := range list {
		vv := strings.Split(v, " ")
		if len(vv) != 2 {
			return "", errors.New("null")
		}
		temp := vv[0]
		vv[0] = vv[1]
		if val, err := ctypeToGoType(temp); err != nil {
			return "", errors.New("null")
		}
		vv[1] = val
		re = re + vv[0] + " " + vv[1] + ","
	}

	return re[:len(re)-1], nil
}

func ctypeToGoType(ctype string) (string, error) {
	var re string
	switch ctype {
	case "uint32_t":
		re = "uint"
	case "uint64_t":
		re = "uint"
	case "const char *":
		re = "string"
	}
	if len(re) == 0 {
		return re, errors.New("no this type")
	}
	return re, nil
}
