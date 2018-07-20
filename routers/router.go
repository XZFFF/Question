package routers

import (
	"Question/controllers"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	beego.Router("/question", &controllers.IndexController{})
}
