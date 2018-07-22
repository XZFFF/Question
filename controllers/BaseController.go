package controllers

import (
	"github.com/astaxie/beego"
	"encoding/json"
	"io"
)

type BaseController struct {
	beego.Controller
	controllerName string
	actionName string
}

func (p *BaseController) PrePare() {
	controllerName, actionName := p.GetControllerAndAction()
	p.controllerName = controllerName
	p.actionName = actionName
	// p.o = orm.NewOrm()
}

// JsonResult 响应 json 结果
func (c *BaseController) JsonResult(errCode int, errMsg string, data ...interface{}) {
	jsonData := make(map[string]interface{}, 3)

	jsonData["errcode"] = errCode
	jsonData["message"] = errMsg

	if len(data) > 0 && data[0] != nil {
		jsonData["data"] = data[0]
	}

	returnJSON, err := json.Marshal(jsonData)

	if err != nil {
		beego.Error(err)
	}

	c.Ctx.ResponseWriter.Header().Set("Content-Type", "application/json; charset=utf-8")
	c.Ctx.ResponseWriter.Header().Set("Cache-Control", "no-cache, no-store")
	io.WriteString(c.Ctx.ResponseWriter, string(returnJSON))

	c.StopRun()
}