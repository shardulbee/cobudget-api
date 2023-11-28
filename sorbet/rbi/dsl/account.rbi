# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `Account`.
# Please instead update this file by running `bin/tapioca dsl Account`.

# typed: false
class Account
  include GeneratedAssociationMethods
  include GeneratedAttributeMethods

  module GeneratedAssociationMethods
    sig { params(args: T.untyped, blk: T.untyped).returns(::Institution) }
    def build_institution(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(::Institution) }
    def create_institution(*args, &blk); end

    sig { params(args: T.untyped, blk: T.untyped).returns(::Institution) }
    def create_institution!(*args, &blk); end

    sig { returns(T.nilable(::Institution)) }
    def institution; end

    sig { params(value: T.nilable(::Institution)).void }
    def institution=(value); end

    sig { returns(T.nilable(::Institution)) }
    def reload_institution; end

    sig { returns(T::Array[T.untyped]) }
    def transaction_ids; end

    sig { params(ids: T::Array[T.untyped]).returns(T::Array[T.untyped]) }
    def transaction_ids=(ids); end

    sig { returns(::ActiveRecord::Associations::CollectionProxy[Transaction]) }
    def transactions; end

    sig { params(value: T::Enumerable[::Transaction]).void }
    def transactions=(value); end
  end

  module GeneratedAttributeMethods
    sig { returns(T.nilable(::String)) }
    def account_type; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def account_type=(value); end

    sig { returns(T::Boolean) }
    def account_type?; end

    sig { returns(T.nilable(::String)) }
    def account_type_before_last_save; end

    sig { returns(T.untyped) }
    def account_type_before_type_cast; end

    sig { returns(T::Boolean) }
    def account_type_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def account_type_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def account_type_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def account_type_changed?; end

    sig { returns(T.nilable(::String)) }
    def account_type_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def account_type_previous_change; end

    sig { returns(T::Boolean) }
    def account_type_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def account_type_previously_was; end

    sig { returns(T.nilable(::String)) }
    def account_type_was; end

    sig { void }
    def account_type_will_change!; end

    sig { returns(T.nilable(::Money)) }
    def balance; end

    sig { params(value: T.nilable(::Money)).returns(T.nilable(::Money)) }
    def balance=(value); end

    sig { returns(T::Boolean) }
    def balance?; end

    sig { returns(T.nilable(::Money)) }
    def balance_before_last_save; end

    sig { returns(T.untyped) }
    def balance_before_type_cast; end

    sig { returns(T::Boolean) }
    def balance_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::Money), T.nilable(::Money)])) }
    def balance_change; end

    sig { returns(T.nilable([T.nilable(::Money), T.nilable(::Money)])) }
    def balance_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def balance_changed?; end

    sig { returns(T.nilable(::Money)) }
    def balance_in_database; end

    sig { returns(T.nilable([T.nilable(::Money), T.nilable(::Money)])) }
    def balance_previous_change; end

    sig { returns(T::Boolean) }
    def balance_previously_changed?; end

    sig { returns(T.nilable(::Money)) }
    def balance_previously_was; end

    sig { returns(T.nilable(::Money)) }
    def balance_was; end

    sig { void }
    def balance_will_change!; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at; end

    sig { params(value: ::ActiveSupport::TimeWithZone).returns(::ActiveSupport::TimeWithZone) }
    def created_at=(value); end

    sig { returns(T::Boolean) }
    def created_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_before_last_save; end

    sig { returns(T.untyped) }
    def created_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def created_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def created_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def created_at_previous_change; end

    sig { returns(T::Boolean) }
    def created_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def created_at_was; end

    sig { void }
    def created_at_will_change!; end

    sig { returns(T.nilable(::String)) }
    def currency; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def currency=(value); end

    sig { returns(T::Boolean) }
    def currency?; end

    sig { returns(T.nilable(::String)) }
    def currency_before_last_save; end

    sig { returns(T.untyped) }
    def currency_before_type_cast; end

    sig { returns(T::Boolean) }
    def currency_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def currency_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def currency_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def currency_changed?; end

    sig { returns(T.nilable(::String)) }
    def currency_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def currency_previous_change; end

    sig { returns(T::Boolean) }
    def currency_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def currency_previously_was; end

    sig { returns(T.nilable(::String)) }
    def currency_was; end

    sig { void }
    def currency_will_change!; end

    sig { returns(T.nilable(::Integer)) }
    def id; end

    sig { params(value: ::Integer).returns(::Integer) }
    def id=(value); end

    sig { returns(T::Boolean) }
    def id?; end

    sig { returns(T.nilable(::Integer)) }
    def id_before_last_save; end

    sig { returns(T.untyped) }
    def id_before_type_cast; end

    sig { returns(T::Boolean) }
    def id_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_change; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def id_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def id_in_database; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def id_previous_change; end

    sig { returns(T::Boolean) }
    def id_previously_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def id_previously_was; end

    sig { returns(T.nilable(::Integer)) }
    def id_was; end

    sig { void }
    def id_will_change!; end

    sig { returns(::Integer) }
    def institution_id; end

    sig { params(value: ::Integer).returns(::Integer) }
    def institution_id=(value); end

    sig { returns(T::Boolean) }
    def institution_id?; end

    sig { returns(T.nilable(::Integer)) }
    def institution_id_before_last_save; end

    sig { returns(T.untyped) }
    def institution_id_before_type_cast; end

    sig { returns(T::Boolean) }
    def institution_id_came_from_user?; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def institution_id_change; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def institution_id_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def institution_id_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def institution_id_in_database; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def institution_id_previous_change; end

    sig { returns(T::Boolean) }
    def institution_id_previously_changed?; end

    sig { returns(T.nilable(::Integer)) }
    def institution_id_previously_was; end

    sig { returns(T.nilable(::Integer)) }
    def institution_id_was; end

    sig { void }
    def institution_id_will_change!; end

    sig { returns(T.nilable(::String)) }
    def mask; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def mask=(value); end

    sig { returns(T::Boolean) }
    def mask?; end

    sig { returns(T.nilable(::String)) }
    def mask_before_last_save; end

    sig { returns(T.untyped) }
    def mask_before_type_cast; end

    sig { returns(T::Boolean) }
    def mask_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def mask_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def mask_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def mask_changed?; end

    sig { returns(T.nilable(::String)) }
    def mask_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def mask_previous_change; end

    sig { returns(T::Boolean) }
    def mask_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def mask_previously_was; end

    sig { returns(T.nilable(::String)) }
    def mask_was; end

    sig { void }
    def mask_will_change!; end

    sig { returns(T.nilable(::String)) }
    def name; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def name=(value); end

    sig { returns(T::Boolean) }
    def name?; end

    sig { returns(T.nilable(::String)) }
    def name_before_last_save; end

    sig { returns(T.untyped) }
    def name_before_type_cast; end

    sig { returns(T::Boolean) }
    def name_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def name_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def name_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def name_changed?; end

    sig { returns(T.nilable(::String)) }
    def name_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def name_previous_change; end

    sig { returns(T::Boolean) }
    def name_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def name_previously_was; end

    sig { returns(T.nilable(::String)) }
    def name_was; end

    sig { void }
    def name_will_change!; end

    sig { returns(T.nilable(::String)) }
    def official_name; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def official_name=(value); end

    sig { returns(T::Boolean) }
    def official_name?; end

    sig { returns(T.nilable(::String)) }
    def official_name_before_last_save; end

    sig { returns(T.untyped) }
    def official_name_before_type_cast; end

    sig { returns(T::Boolean) }
    def official_name_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def official_name_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def official_name_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def official_name_changed?; end

    sig { returns(T.nilable(::String)) }
    def official_name_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def official_name_previous_change; end

    sig { returns(T::Boolean) }
    def official_name_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def official_name_previously_was; end

    sig { returns(T.nilable(::String)) }
    def official_name_was; end

    sig { void }
    def official_name_will_change!; end

    sig { returns(T.nilable(::String)) }
    def remote_id; end

    sig { params(value: T.nilable(::String)).returns(T.nilable(::String)) }
    def remote_id=(value); end

    sig { returns(T::Boolean) }
    def remote_id?; end

    sig { returns(T.nilable(::String)) }
    def remote_id_before_last_save; end

    sig { returns(T.untyped) }
    def remote_id_before_type_cast; end

    sig { returns(T::Boolean) }
    def remote_id_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def remote_id_change; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def remote_id_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def remote_id_changed?; end

    sig { returns(T.nilable(::String)) }
    def remote_id_in_database; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def remote_id_previous_change; end

    sig { returns(T::Boolean) }
    def remote_id_previously_changed?; end

    sig { returns(T.nilable(::String)) }
    def remote_id_previously_was; end

    sig { returns(T.nilable(::String)) }
    def remote_id_was; end

    sig { void }
    def remote_id_will_change!; end

    sig { void }
    def restore_account_type!; end

    sig { void }
    def restore_balance!; end

    sig { void }
    def restore_created_at!; end

    sig { void }
    def restore_currency!; end

    sig { void }
    def restore_id!; end

    sig { void }
    def restore_institution_id!; end

    sig { void }
    def restore_mask!; end

    sig { void }
    def restore_name!; end

    sig { void }
    def restore_official_name!; end

    sig { void }
    def restore_remote_id!; end

    sig { void }
    def restore_updated_at!; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_account_type; end

    sig { returns(T::Boolean) }
    def saved_change_to_account_type?; end

    sig { returns(T.nilable([T.nilable(::Money), T.nilable(::Money)])) }
    def saved_change_to_balance; end

    sig { returns(T::Boolean) }
    def saved_change_to_balance?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_created_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_created_at?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_currency; end

    sig { returns(T::Boolean) }
    def saved_change_to_currency?; end

    sig { returns(T.nilable([T.nilable(::Integer), T.nilable(::Integer)])) }
    def saved_change_to_id; end

    sig { returns(T::Boolean) }
    def saved_change_to_id?; end

    sig { returns(T.nilable([::Integer, ::Integer])) }
    def saved_change_to_institution_id; end

    sig { returns(T::Boolean) }
    def saved_change_to_institution_id?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_mask; end

    sig { returns(T::Boolean) }
    def saved_change_to_mask?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_name; end

    sig { returns(T::Boolean) }
    def saved_change_to_name?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_official_name; end

    sig { returns(T::Boolean) }
    def saved_change_to_official_name?; end

    sig { returns(T.nilable([T.nilable(::String), T.nilable(::String)])) }
    def saved_change_to_remote_id; end

    sig { returns(T::Boolean) }
    def saved_change_to_remote_id?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def saved_change_to_updated_at; end

    sig { returns(T::Boolean) }
    def saved_change_to_updated_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at; end

    sig { params(value: ::ActiveSupport::TimeWithZone).returns(::ActiveSupport::TimeWithZone) }
    def updated_at=(value); end

    sig { returns(T::Boolean) }
    def updated_at?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_before_last_save; end

    sig { returns(T.untyped) }
    def updated_at_before_type_cast; end

    sig { returns(T::Boolean) }
    def updated_at_came_from_user?; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_change; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_change_to_be_saved; end

    sig { returns(T::Boolean) }
    def updated_at_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_in_database; end

    sig { returns(T.nilable([T.nilable(::ActiveSupport::TimeWithZone), T.nilable(::ActiveSupport::TimeWithZone)])) }
    def updated_at_previous_change; end

    sig { returns(T::Boolean) }
    def updated_at_previously_changed?; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_previously_was; end

    sig { returns(T.nilable(::ActiveSupport::TimeWithZone)) }
    def updated_at_was; end

    sig { void }
    def updated_at_will_change!; end

    sig { returns(T::Boolean) }
    def will_save_change_to_account_type?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_balance?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_created_at?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_currency?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_id?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_institution_id?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_mask?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_name?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_official_name?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_remote_id?; end

    sig { returns(T::Boolean) }
    def will_save_change_to_updated_at?; end
  end
end