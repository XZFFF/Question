package controllers

import (
	"github.com/astaxie/beego"
)

type ContentController struct {
	beego.Controller
}

func (c *ContentController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "content.tpl"
}
