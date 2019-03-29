let stylesheet: StaticString = """
body {
  padding: 0.5rem;
  line-height: 1.35;
  font-family: SanFranciscoDisplay-Regular;
}

blockquote {
  border-left: 2px #777 solid;
  font-style: italic;
  color: #777;
  margin-left: 1rem;
  padding-left: 0.5rem;
}

pre {
  background-color: #f3f3f3;
  padding: 0.5rem;
  overflow-x: scroll;
}

code {
  background-color: #f3f3f3;
  padding: 0.25rem;
}

li:not(:last-child) {
    margin-bottom: 0.25rem;
}

h2 {
  margin-top: 2rem;
  margin-bottom: 0;
}
"""
