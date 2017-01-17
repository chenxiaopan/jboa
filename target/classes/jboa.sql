--休假
select * from leave;

 --1)添加
   name:当前登录的用户名;
   checkid :审批人(supper=1,不能包含自己!)
   whoid : 申请人(当前登录的用户ID)
   status:   0: 默认值 未审批;  1:已审批; 2:拒绝;
   
  --2)查看当前需要审批的休假的用户 ??
  select * from leave where checkid=登录用户ID and status=0
   
  --3)审核 其实修改
  update leave set status=0;
  

--邮件
select * from mails;

  --1)添加 
  fromone :当前登录的用户编号
  toone : 收件人当前选中的编号 (用户表的昵称信息);不能包含自己
  pbtime: 系统默认时间;
  isread: 是否读取 0:默认值未读; 1:已读;
  isdel:是否删除 0: 默认值未删除,1:垃圾箱中
  attachment: 上传的文件名;
  
  --2)查看所有的邮件
  select *from mails
  
  --3)根据标题查看邮件信息
  select * from mails where title='' and id=26
  
  --4)根据ID删除邮件到垃圾箱
  update mails set isdel=1 where id=43
  
  --5)显示垃圾箱的邮件
  select * from  mails where isdel=1
  
  
  --6)还原  其实就是修改 ==>回到 收邮件中
   update mails set isdel=0 where id=43
   
   
   --7)删除  
   delete from mails where id=43;
   

--用户
select * from users;  (不能建关系!)
supper -->权限  0:普通用户; 1:管理员;

--登录
select count(1) from users where username='330' and password='aaa'

--修改  :当前的用户26
update users set ..... where id=26

--添加
insert into users values(...)

--查看
select * from users;
select * from leave;
select *from mails;

 select * from mails where isdel=0 
 
create sequence seq start with 50;
select seq.nextval from dual;
 
 
 update mails set isdel=0 ;
 
 insert into mails(id,title) values(100,'300元');
 
 delete users where id=52;
 delete mails where id=53;
 
 
 