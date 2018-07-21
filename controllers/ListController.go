package controllers

import (
	"github.com/astaxie/beego"
)

type ListController struct {
	beego.Controller
}

func (c *ListController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "list.tpl"
}
