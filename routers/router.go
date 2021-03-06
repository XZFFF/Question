package routers

import (
	"Question/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.IndexController{})
	beego.Router("/index", &controllers.IndexController{})
	beego.Router("/list", &controllers.ListController{})
	beego.Router("/content", &controllers.ContentController{})
}
