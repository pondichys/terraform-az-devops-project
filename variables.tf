variable "azdevops_project_name" {
  type = string
  default = "Terraform-Test"
}

variable "azdevops_project_userlist" {
  type    = set(string)
  default = []
}

variable "azdevops_project_features" {
  type = map(any)
  default = {
    artifacts    = "disabled"
    boards       = "enabled"
    pipelines    = "enabled"
    repositories = "enabled"
    testplans    = "disabled"
  }
}

variable "azdevops_limited_admin_group_project_permissions" {
  type = map(any)
  default = {
    GENERIC_READ                 = "Allow"
    GENERIC_WRITE                = "Deny"
    DELETE                       = "Allow"
    PUBLISH_TEST_RESULTS         = "Allow"
    ADMINISTER_BUILD             = "Allow"
    START_BUILD                  = "Allow"
    EDIT_BUILD_STATUS            = "Allow"
    UPDATE_BUILD                 = "Allow"
    DELETE_TEST_RESULTS          = "Allow"
    VIEW_TEST_RESULTS            = "Allow"
    MANAGE_TEST_ENVIRONMENTS     = "Allow"
    MANAGE_TEST_CONFIGURATIONS   = "Allow"
    WORK_ITEM_DELETE             = "Allow"
    WORK_ITEM_MOVE               = "Deny"
    WORK_ITEM_PERMANENTLY_DELETE = "Allow"
    RENAME                       = "Deny"
    MANAGE_PROPERTIES            = "Allow"
    # MANAGE_SYSTEM_PROPERTIES = "Allow"
    # BYPASS_PROPERTY_CACHE = "Allow"
    BYPASS_RULES           = "Allow"
    SUPPRESS_NOTIFICATIONS = "Allow"
    UPDATE_VISIBILITY      = "Deny"
    CHANGE_PROCESS         = "Deny"
    # AGILETOOLS_BACKLOG = "Allow"
    # AGILETOOLS_PLANS = "Allow"
  }
}

variable "azdevops_limited_admin_group_git_root_permissions" {
  type = map(any)
  default = {
    Administer              = "Deny"
    CreateBranch            = "Allow"
    CreateRepository        = "Allow"
    CreateTag               = "Allow"
    DeleteRepository        = "Allow"
    EditPolicies            = "Allow"
    ForcePush               = "NotSet"
    GenericContribute       = "Allow"
    GenericRead             = "Allow"
    ManageNote              = "Allow"
    ManagePermissions       = "Deny"
    PolicyExempt            = "NotSet"
    PullRequestBypassPolicy = "NotSet"
    PullRequestContribute   = "Allow"
    RemoveOthersLocks       = "Allow"
    RenameRepository        = "Allow"
  }
}