##登录测试
#call get_teacher_password('t');
#call get_teacher_password('t00');
#call get_student_password('s00');
#call get_temporary_password('tem00');

##查询自己项目测试
#call get_own_project('s00','s','#');
#call get_own_project('s00','s','p01');
#call get_own_project('tem00','tem','#');
#call get_own_project('tem00','s','#');
#call get_own_project('t00','t','p01');
#call get_own_project('s00','s','#');

##查询他人项目测试
##测试 # #
#call get_other_project('t00','#','#','dsff');
##测试 有 #
#call get_other_project('t00','p00','#','#');#是他负责
#call get_other_project('t00','p05','#','#');#不是他负责
##测试 # 有
#call get_other_project('t00','#','s00','s');
#call get_other_project('t00','#','t00','t');
#call get_other_project('t00','#','tem00','tem');
#call get_other_project('t00','#','s05','s');#查无此人
#call get_other_project('t00','#','s00','t');#查无此人D
##测试 有 有
#call get_other_project('t00','p00','s00','s');
#call get_other_project('t00','p00','t00','t');
#call get_other_project('t00','p00','tem00','tem');
#call get_other_project('t00','p00','s05','s');#查无此人
#call get_other_project('t00','p00','s00','t');#查无此人
