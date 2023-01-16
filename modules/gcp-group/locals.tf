locals {
  /* ------------------------ Break apart role binding ------------------------ */
  org_iam_bindings = tolist(
    [for binding in var.roles : var.org_group ? binding : null]
  )
  folder_iam_bindings = tolist(
    [for binding in var.roles : var.folder_group ? binding : null]
  )
}
