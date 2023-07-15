resource "aws_db_instance" "wordpress"{
  allocated_storage = 20
  storage_type      ="gp2"
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "appmysql"
  username             = "root"
  password             = "1*bhgbty"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  iam_database_authentication_enabled =true
  backup_retention_period = 0
}

resource "null_resource" "deploy-wordpress" {
    depends_on = [
        aws_db_instance.wordpress,
    ]
    provisioner "local-exec" {
       command = "kubectl create -k ."
    }

}