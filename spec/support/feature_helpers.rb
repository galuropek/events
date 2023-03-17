module FeatureHelpers
  def invalid_attr(attr, msg, extra = {})
    attributes_format = { attribute: attr, message: I18n.t("errors.messages.#{msg}", extra) }
    I18n.t('errors.format', attributes_format)
  end
end
