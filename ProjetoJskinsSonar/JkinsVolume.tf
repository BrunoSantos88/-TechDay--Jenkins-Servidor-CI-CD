resource "aws_ebs_volume" "volume" {
    availability_zone = aws_instance.jks.availability_zone
    size = 50
    tags = {
        Name = "jenkis_server*volume"
         }
}


resource "aws_volume_attachment" "ebs_att_task2" {
  device_name = "*Jenkis*sever"
  volume_id   = aws_ebs_volume.volume.id
  instance_id = aws_instance.jks.id

  }