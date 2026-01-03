// Generic two by two component for resume
#let generic-two-by-two(
  top-left: "",
  top-right: "",
  bottom-left: "",
  bottom-right: "",
) = {
  // these will be empty if it's a multi role entry
  // since these are already defined in the top row
  if top-left == none and top-right == none {
    [#bottom-left #h(1fr) #bottom-right]
  } else {
    [
      #top-left #h(1fr) #top-right \
      #bottom-left #h(1fr) #bottom-right
    ]
  }
}

// Generic one by two component for resume
#let generic-one-by-two(
  left: "",
  right: "",
) = {
  [
    #left #h(1fr) #right
  ]
}

// Cannot just use normal --- ligature becuase ligatures are disabled for good reasons
#let dates-helper(
  start-date: "",
  end-date: "",
) = {
  start-date + " " + $dash$ + " " + end-date
}
