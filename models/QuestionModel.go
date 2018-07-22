package models

import (
	// "github.com/astaxie/beego"
	// "fmt"
	"time"
	"github.com/astaxie/beego/orm"
	_ "github.com/Go-SQL-Driver/mysql"
)


type Question struct {
	Id            int       `orm:"pk;auto;unique;column(id)" json:"id"`
	Title         string    `orm:"cloumn(title);size(200)" json:"title"`
	Image         string    `orm:"cloumn(image);size(200)" json:"image"`
	Date          time.Time `orm:"cloumn(date);type(datetime)" json:"date"`
	Content       string    `orm:"cloumn(content);type(text)" json:"content"`
	Source        string    `orm:"cloumn(source);size(200)" json:"source"`
	Order         int       `orm:"cloumn(order);type(int)" json:"order"`
	Like          int       `orm:"cloumn(like);type(int)" json:"like"`
	Dislike       int       `orm:"cloumn(dislike);type(int)" json:"dislike"`
	User_type     int       `orm:"cloumn(user_type);type(int)" json:"user_type"`
	Question_type int       `orm:"cloumn(question_type);type(int)" json:"question_type"`
}

func init() {
	// [username[:password]@][protocol[(address)]]/dbname[?param1=value1&...&paramN=valueN]
	orm.RegisterDataBase("default", "mysql", "root:@/kw_question?charset=utf8mb4", 30)

	// register model
	orm.RegisterModel(new (Question))
}


// TableName 获取对应数据库表名.
func (m *Question) TableName() string {
	return TableName("question")
}

func GetQuestionList() ([]Question, error) {
	o := orm.NewOrm()
	var list []Question
	_, err := o.QueryTable("question").Filter("order", 1).All(&list)
	
	return list, err
}

func SearchQuestionList(keyword string) ([]Question, error) {
	o := orm.NewOrm()
	var list []Question
	_, err := o.QueryTable("question").Filter("title__contains", keyword).All(&list)
	
	return list, err
}

func GetQuestionTypeList(questionType int) ([]Question, error) {
	o := orm.NewOrm()
	var list []Question
	_, err := o.QueryTable("question").Filter("question_type", questionType).All(&list)
	
	return list, err
}


func GetById(id int) (Question, error) {
	o := orm.NewOrm()
	question := Question{Id: id}
	q := Question{Id: question.Id}
	err := o.Read(&q)
	return q, err
}


