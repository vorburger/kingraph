def inplace_change(filename, old_string, new_string):
    with open(filename) as f:
        s = f.read()
        if old_string not in s:
            return

    with open(filename, 'w') as f:
        s = s.replace(old_string, new_string)
        f.write(s)


inplace_change('family.svg', '<polygon fill="white" stroke="none"', '<polygon fill="#2b2b2b" stroke="none"')  # main BG

inplace_change('family.svg', 'fafafa', '313335')  # House BG
inplace_change('family.svg', 'font-weight="bold" font-size="16.00">', 'font-weight="bold" font-size="16.00" fill="#D0D0D0">')  # House title

inplace_change('family.svg', 'white', '#424445')  # Person box BG
inplace_change('family.svg', 'class="node"><title>', 'class="node" fill="#D0D0D0"><title>')  # Person box title
inplace_change('family.svg', 'aaaaaa', 'FFC66D')  # Person box subtitle


