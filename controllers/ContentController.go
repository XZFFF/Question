package controllers

import (
	"Question/models"
)

type ContentController struct {
	BaseController
}

func (c *ContentController) Get() {
	c.TplName = "content.tpl"
	id, _ := c.GetInt("id", 1)
	question, err := models.GetById(id)
	c.Data["Question"] = question
	c.Data["Content"] = question.Content
	c.Data["Error"] = err
}

// 点赞、踩功能
func (c *ContentController) Post() {
	c.TplName = "content.tpl"
	id, _ := c.GetInt("id", 0)
	likeType := c.GetString("like_type")
	// 如果传入了id，修改该条目的like/dislike值
	if id > 0 {
		models.LikeInc(id, likeType)
		return
	}
}
