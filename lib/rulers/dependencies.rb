class Object
  def self.const_missing(const)
    filename = Rulers.to_underscore(const.to_s)

    return if $LOADED_FEATURES.any? { |p| p == filename }

    require filename
    Object.const_get(const)
  end
end
