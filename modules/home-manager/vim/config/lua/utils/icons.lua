local M = {}

M.icons = {
  Vim = "",
  Config = "",
  Normal = "󰡛",
  Insert = "󰌌",
  Terminal = "",
  Visual = "󰉸",
  Command = "",
  Save = "󰳻",
  NotSaved = "󱙃",
  Restore = "",
  Trash = "",
  Fedora = "",
  Lua = "",
  Github = "",
  Git = "󰊢",
  GitDiff = "",
  GitBranch = "",
  GitCommit = "",
  Add = "󰐕",
  Modified = "󰜥",
  Removed = "󰍴",
  DiffRemoved = "",
  Error = "󰅚",
  Info = "󰋽",
  Warn = "",
  Hint = "",
  Package = "󰏖",
  FileTree = "󰙅",
  Folder = "",
  EmptyFolder = "",
  FolderClock = "󰪻",
  FolderOpened = "",
  File = "",
  NewFile = "",
  DefaultFile = "󰈙",
  Color = "",
  ColorPicker = "󰴱",
  ColorOn = "󰌁",
  ColorOff = "󰹊",
  Swap = "󰓡",
  Minimap = "",
  Window = "",
  Windows = "",
  Ellipsis = "…",
  Search = "",
  TextSearch = "󱩾",
  TabSearch = "󱦞",
  FileSearch = "󰱼",
  Clear = "",
  Braces = "󰅩",
  Exit = "",
  Debugger = "",
  Breakpoint = "",
  History = "",
  Check = "󰄵",
  SmallDot = "󰧞",
  Dots = "󰇘",
  Install = "",
  Help = "󰋖",
  Clipboard = "󰅌",
  Indent = "",
  LineWrap = "󰖶",
  Comment = "󱋄",
  Close = "󰅘",
  Open = "󰏋",
  Toggle = "󰔡",
  Stop = "",
  Restart = "",
  CloseMultiple = "󰱞",
  NextBuffer = "󰮱,",
  PrevBuffer = "󰮳",
  FoldClose = "",
  FoldOpen = "",
  Popup = "󰕛",
  Vertical = "",
  Horizontal = "",
  Markdown = "󰽛",
  Up = "",
  Down = "",
  Left = "",
  Right = "",
  Variable = "",
  Symbol = "",
  Stack = "",
  Format = "󰉣",
  Edit = "󰤌",
  Fix = "",
  Run = "󰐍",
  Twilight = "󰖚",
  Recording = "󰑋",
  Notification = "󰍢",
  NotificationDismiss = "󱙍",
  NotificationLog = "󰍩",
  Code = "",
  DropDown = "󰁊",
  Web = "󰖟",
  Dependencies = "",
  Update = "󰚰",
  Database = "",
  Pin = "",
  Book = "󰂽",
  BookmarkSearch = "󰺄",
  Download = "󰇚",
}

M.fmt = function(icon, text, space) return M.icons[icon] .. string.rep(" ", space or 1) .. text end

return M
