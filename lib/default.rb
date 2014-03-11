# All files in the 'lib' directory will be loaded
# before nanoc starts compiling.

include Nanoc::Helpers::Rendering
include Nanoc::Helpers::Blogging
include Nanoc::Helpers::LinkTo


# Helper to filter pages by extension
def filter_by_extension
  if item[:extension] == "haml"
    filter :haml
  else
    filter :erb
    filter :kramdown, coderay_line_numbers: :table
  end
end

# Extending Nanoc::Item
module Nanoc
  class Item
    # Grab post content before <!-- more --> if it exists
    def raw_preview
      more_index = self.raw_content.index "<!-- more -->"
      more_index ? self.raw_content[0..more_index-1] : self.raw_content
    end
    # true if has <!-- more --> tag
    def has_preview?
      self.raw_content.include? "<!-- more -->"
    end
  end
end