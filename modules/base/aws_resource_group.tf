resource "aws_resourcegroups_group" "main" {
  name = title(var.project)

  resource_query {
    query = jsonencode(
      {
        ResourceTypeFilters = [
          "AWS::AllSupported",
        ]
        TagFilters = [
          {
            Key = "Project"
            Values = [
              title(var.project),
            ]
          },
        ]
      }
    )
    type = "TAG_FILTERS_1_0"
  }

  tags = { Name = title(var.project) }
}
