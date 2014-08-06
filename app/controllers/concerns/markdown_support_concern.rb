module Redcarpeted
  extend ActiveSupport::Concern

  module ClassMethods

    def redcarpet(field)
      define_method("#{field}_markdown".to_sym) do
        read_attribute(field)
      end

      define_method("#{field}_html".to_sym) do
        Redcarpet.new(read_attribute(field)).to_html
      end
    end

  end

end