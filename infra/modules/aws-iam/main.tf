resource "aws_iam_policy" "policy" {
  policy = data.template_file.policy.rendered
}

data "template_file" "policy" {
  template = file("${path.module}/templates/iam-policy.json.tpl")
  vars = {
    bucket_name = "test-bucket"
    key_id      = "7890zyxw-45pq-34cd-56ef-1234567890ab"
  }
}

output "policy" {
  value = aws_iam_policy.policy
}
