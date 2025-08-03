module LinkedRecordsProtection
  extend ActiveSupport::Concern

  included do
    before_destroy :ensure_not_linked, if: -> { has_signatures? || has_packages? }
  end

  private

    def ensure_not_linked
      errors.add(:base, "This #{self.class.name} is linked to packages or signatures."); throw :abort
    end

    def has_signatures?
      respond_to?(:signatures) && signatures.exists?
    end

    def has_packages?
      respond_to?(:packages) && packages.exists?
    end
end
