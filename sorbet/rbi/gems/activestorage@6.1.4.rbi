# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `activestorage` gem.
# Please instead update this file by running `bin/tapioca sync`.

# typed: strict

module ActiveStorage
  extend ::ActiveSupport::Autoload

  def analyzers; end
  def analyzers=(val); end
  def binary_content_type; end
  def binary_content_type=(val); end
  def content_types_allowed_inline; end
  def content_types_allowed_inline=(val); end
  def content_types_to_serve_as_binary; end
  def content_types_to_serve_as_binary=(val); end
  def draw_routes; end
  def draw_routes=(val); end
  def logger; end
  def logger=(val); end
  def paths; end
  def paths=(val); end
  def previewers; end
  def previewers=(val); end
  def queues; end
  def queues=(val); end
  def replace_on_assign_to_many; end
  def replace_on_assign_to_many=(val); end
  def resolve_model_to_route; end
  def resolve_model_to_route=(val); end
  def routes_prefix; end
  def routes_prefix=(val); end
  def service_urls_expire_in; end
  def service_urls_expire_in=(val); end
  def track_variants; end
  def track_variants=(val); end
  def variable_content_types; end
  def variable_content_types=(val); end
  def variant_processor; end
  def variant_processor=(val); end
  def verifier; end
  def verifier=(val); end
  def video_preview_arguments; end
  def video_preview_arguments=(val); end
  def web_image_content_types; end
  def web_image_content_types=(val); end

  class << self
    def analyzers; end
    def analyzers=(val); end
    def binary_content_type; end
    def binary_content_type=(val); end
    def content_types_allowed_inline; end
    def content_types_allowed_inline=(val); end
    def content_types_to_serve_as_binary; end
    def content_types_to_serve_as_binary=(val); end
    def draw_routes; end
    def draw_routes=(val); end
    def gem_version; end
    def logger; end
    def logger=(val); end
    def paths; end
    def paths=(val); end
    def previewers; end
    def previewers=(val); end
    def queues; end
    def queues=(val); end
    def railtie_helpers_paths; end
    def railtie_namespace; end
    def railtie_routes_url_helpers(include_path_helpers = T.unsafe(nil)); end
    def replace_on_assign_to_many; end
    def replace_on_assign_to_many=(val); end
    def resolve_model_to_route; end
    def resolve_model_to_route=(val); end
    def routes_prefix; end
    def routes_prefix=(val); end
    def service_urls_expire_in; end
    def service_urls_expire_in=(val); end
    def table_name_prefix; end
    def track_variants; end
    def track_variants=(val); end
    def use_relative_model_naming?; end
    def variable_content_types; end
    def variable_content_types=(val); end
    def variant_processor; end
    def variant_processor=(val); end
    def verifier; end
    def verifier=(val); end
    def version; end
    def video_preview_arguments; end
    def video_preview_arguments=(val); end
    def web_image_content_types; end
    def web_image_content_types=(val); end
  end
end

class ActiveStorage::AnalyzeJob < ::ActiveStorage::BaseJob
  def perform(blob); end

  class << self
    def queue_name; end
    def rescue_handlers; end
  end
end

class ActiveStorage::Analyzer
  def initialize(blob); end

  def blob; end
  def metadata; end

  private

  def download_blob_to_tempfile(&block); end
  def logger; end
  def tmpdir; end

  class << self
    def accept?(blob); end
    def analyze_later?; end
  end
end

class ActiveStorage::Analyzer::ImageAnalyzer < ::ActiveStorage::Analyzer
  def metadata; end

  private

  def read_image; end
  def rotated_image?(image); end

  class << self
    def accept?(blob); end
  end
end

class ActiveStorage::Analyzer::NullAnalyzer < ::ActiveStorage::Analyzer
  def metadata; end

  class << self
    def accept?(blob); end
    def analyze_later?; end
  end
end

class ActiveStorage::Analyzer::VideoAnalyzer < ::ActiveStorage::Analyzer
  def metadata; end

  private

  def angle; end
  def computed_height; end
  def container; end
  def display_aspect_ratio; end
  def display_height_scale; end
  def duration; end
  def encoded_height; end
  def encoded_width; end
  def ffprobe_path; end
  def height; end
  def probe; end
  def probe_from(file); end
  def rotated?; end
  def streams; end
  def tags; end
  def video_stream; end
  def width; end

  class << self
    def accept?(blob); end
  end
end

class ActiveStorage::Attached
  def initialize(name, record); end

  def name; end
  def record; end

  private

  def change; end
end

module ActiveStorage::Attached::Changes
  extend ::ActiveSupport::Autoload
end

class ActiveStorage::Attached::Changes::CreateMany
  def initialize(name, record, attachables); end

  def attachables; end
  def attachments; end
  def blobs; end
  def name; end
  def record; end
  def save; end
  def upload; end

  private

  def assign_associated_attachments; end
  def build_subchange_from(attachable); end
  def reset_associated_blobs; end
  def subchanges; end
end

class ActiveStorage::Attached::Changes::CreateOne
  def initialize(name, record, attachable); end

  def attachable; end
  def attachment; end
  def blob; end
  def name; end
  def record; end
  def save; end
  def upload; end

  private

  def attachment_service_name; end
  def build_attachment; end
  def find_attachment; end
  def find_or_build_attachment; end
  def find_or_build_blob; end
end

class ActiveStorage::Attached::Changes::CreateOneOfMany < ::ActiveStorage::Attached::Changes::CreateOne
  private

  def find_attachment; end
end

class ActiveStorage::Attached::Changes::DeleteMany
  def initialize(name, record); end

  def attachables; end
  def attachments; end
  def blobs; end
  def name; end
  def record; end
  def save; end
end

class ActiveStorage::Attached::Changes::DeleteOne
  def initialize(name, record); end

  def attachment; end
  def name; end
  def record; end
  def save; end
end

class ActiveStorage::Attached::Many < ::ActiveStorage::Attached
  def attach(*attachables); end
  def attached?; end
  def attachments; end
  def blobs; end
  def detach; end
  def method_missing(method, *args, &block); end

  private

  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
end

module ActiveStorage::Attached::Model
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveStorage::Attached::Model::ClassMethods

  def attachment_changes; end
  def changed_for_autosave?; end
  def reload(*_arg0); end

  private

  def initialize_dup(*_arg0); end
end

module ActiveStorage::Attached::Model::ClassMethods
  def has_many_attached(name, dependent: T.unsafe(nil), service: T.unsafe(nil), strict_loading: T.unsafe(nil)); end
  def has_one_attached(name, dependent: T.unsafe(nil), service: T.unsafe(nil), strict_loading: T.unsafe(nil)); end

  private

  def validate_service_configuration(association_name, service); end
end

class ActiveStorage::Attached::One < ::ActiveStorage::Attached
  def attach(attachable); end
  def attached?; end
  def attachment; end
  def blank?; end
  def detach; end
  def method_missing(method, *args, &block); end
  def purge; end
  def purge_later; end

  private

  def respond_to_missing?(name, include_private = T.unsafe(nil)); end
  def write_attachment(attachment); end
end

class ActiveStorage::Attachment < ::ActiveStorage::Record
  include ::ActiveStorage::Attachment::GeneratedAttributeMethods
  include ::ActiveStorage::Attachment::GeneratedAssociationMethods

  def autosave_associated_records_for_blob(*args); end
  def autosave_associated_records_for_record(*args); end
  def method_missing(method, *args, &block); end
  def purge; end
  def purge_later; end
  def signed_id(*_arg0, &_arg1); end
  def validate_associated_records_for_blob(*args); end

  private

  def analyze_blob_later; end
  def dependent; end
  def mirror_blob_later; end
  def purge_dependent_blob_later; end
  def respond_to_missing?(name, include_private = T.unsafe(nil)); end

  class << self
    def __callbacks; end
    def _reflections; end
    def _validators; end
    def defined_enums; end
  end
end

module ActiveStorage::Attachment::GeneratedAssociationMethods
  def blob; end
  def blob=(value); end
  def build_blob(*args, &block); end
  def create_blob(*args, &block); end
  def create_blob!(*args, &block); end
  def record; end
  def record=(value); end
  def reload_blob; end
  def reload_record; end
end

module ActiveStorage::Attachment::GeneratedAttributeMethods; end

class ActiveStorage::BaseController < ::ActionController::Base
  include ::ActiveStorage::SetCurrent

  private

  def _layout(lookup_context, formats); end
  def stream(blob); end

  class << self
    def __callbacks; end
    def etag_with_template_digest; end
    def middleware_stack; end
  end
end

class ActiveStorage::BaseJob < ::ActiveJob::Base; end

class ActiveStorage::Blob < ::ActiveStorage::Record
  include ::ActiveStorage::Blob::GeneratedAttributeMethods
  include ::ActiveStorage::Blob::GeneratedAssociationMethods

  class << self
    def _validators; end
    def defined_enums; end
  end
end

module ActiveStorage::Blob::Analyzable
  def analyze; end
  def analyze_later; end
  def analyzed?; end

  private

  def analyzer; end
  def analyzer_class; end
  def extract_metadata_via_analyzer; end
end

module ActiveStorage::Blob::GeneratedAssociationMethods; end
module ActiveStorage::Blob::GeneratedAttributeMethods; end

module ActiveStorage::Blob::Identifiable
  def identified?; end
  def identify; end
  def identify_without_saving; end

  private

  def download_identifiable_chunk; end
  def identify_content_type; end
end

module ActiveStorage::Blob::Representable
  extend ::ActiveSupport::Concern

  def preview(transformations); end
  def previewable?; end
  def representable?; end
  def representation(transformations); end
  def variable?; end
  def variant(transformations); end

  private

  def default_variant_format; end
  def default_variant_transformations; end
  def format; end
  def variant_class; end
end

class ActiveStorage::Current < ::ActiveSupport::CurrentAttributes
  class << self
    def host; end
    def host=(attribute); end
  end
end

class ActiveStorage::DirectUploadsController < ::ActiveStorage::BaseController
  def create; end

  private

  def _layout(lookup_context, formats); end
  def blob_args; end
  def direct_upload_json(blob); end

  class << self
    def __callbacks; end
    def middleware_stack; end
  end
end

class ActiveStorage::DiskController < ::ActiveStorage::BaseController
  include ::ActiveStorage::FileServer

  def show; end
  def update; end

  private

  def _layout(lookup_context, formats); end
  def acceptable_content?(token); end
  def decode_verified_key; end
  def decode_verified_token; end
  def named_disk_service(name); end

  class << self
    def __callbacks; end
    def middleware_stack; end
  end
end

class ActiveStorage::Downloader
  def initialize(service); end

  def open(key, checksum:, name: T.unsafe(nil), tmpdir: T.unsafe(nil)); end
  def service; end

  private

  def download(key, file); end
  def open_tempfile(name, tmpdir = T.unsafe(nil)); end
  def verify_integrity_of(file, checksum:); end
end

class ActiveStorage::Engine < ::Rails::Engine; end
class ActiveStorage::Error < ::StandardError; end
class ActiveStorage::FileNotFoundError < ::ActiveStorage::Error; end

module ActiveStorage::FileServer
  private

  def serve_file(path, content_type:, disposition:); end
end

class ActiveStorage::Filename
  include ::Comparable

  def initialize(filename); end

  def <=>(other); end
  def as_json(*_arg0); end
  def base; end
  def extension; end
  def extension_with_delimiter; end
  def extension_without_delimiter; end
  def sanitized; end
  def to_json; end
  def to_s; end

  class << self
    def wrap(filename); end
  end
end

class ActiveStorage::IntegrityError < ::ActiveStorage::Error; end
class ActiveStorage::InvariableError < ::ActiveStorage::Error; end

class ActiveStorage::LogSubscriber < ::ActiveSupport::LogSubscriber
  def logger; end
  def service_delete(event); end
  def service_delete_prefixed(event); end
  def service_download(event); end
  def service_exist(event); end
  def service_mirror(event); end
  def service_streaming_download(event); end
  def service_upload(event); end
  def service_url(event); end

  private

  def debug(event, colored_message); end
  def info(event, colored_message); end
  def key_in(event); end
  def log_prefix_for_service(event); end
end

class ActiveStorage::MirrorJob < ::ActiveStorage::BaseJob
  def perform(key, checksum:); end

  class << self
    def queue_name; end
    def rescue_handlers; end
  end
end

class ActiveStorage::Preview
  def initialize(blob, variation_or_variation_key); end

  def blob; end
  def download(&block); end
  def image; end
  def key; end
  def processed; end
  def service_url(*args, &block); end
  def url(**options); end
  def variation; end

  private

  def previewer; end
  def previewer_class; end
  def process; end
  def processed?; end
  def variant; end
end

class ActiveStorage::Preview::UnprocessedError < ::StandardError; end
class ActiveStorage::PreviewError < ::ActiveStorage::Error; end

class ActiveStorage::Previewer
  def initialize(blob); end

  def blob; end
  def preview(**options); end

  private

  def capture(*argv, to:); end
  def download_blob_to_tempfile(&block); end
  def draw(*argv); end
  def instrument(operation, payload = T.unsafe(nil), &block); end
  def logger; end
  def open_tempfile; end
  def tmpdir; end

  class << self
    def accept?(blob); end
  end
end

class ActiveStorage::Previewer::MuPDFPreviewer < ::ActiveStorage::Previewer
  def preview(**options); end

  private

  def draw_first_page_from(file, &block); end

  class << self
    def accept?(blob); end
    def mutool_exists?; end
    def mutool_path; end
  end
end

class ActiveStorage::Previewer::PopplerPDFPreviewer < ::ActiveStorage::Previewer
  def preview(**options); end

  private

  def draw_first_page_from(file, &block); end

  class << self
    def accept?(blob); end
    def pdftoppm_exists?; end
    def pdftoppm_path; end
  end
end

class ActiveStorage::Previewer::VideoPreviewer < ::ActiveStorage::Previewer
  def preview(**options); end

  private

  def draw_relevant_frame_from(file, &block); end

  class << self
    def accept?(blob); end
    def ffmpeg_exists?; end
    def ffmpeg_path; end
  end
end

class ActiveStorage::PurgeJob < ::ActiveStorage::BaseJob
  def perform(blob); end

  class << self
    def queue_name; end
    def rescue_handlers; end
  end
end

class ActiveStorage::Record < ::ActiveRecord::Base
  include ::ActiveStorage::Record::GeneratedAttributeMethods
  include ::ActiveStorage::Record::GeneratedAssociationMethods

  class << self
    def _validators; end
    def defined_enums; end
  end
end

module ActiveStorage::Record::GeneratedAssociationMethods; end
module ActiveStorage::Record::GeneratedAttributeMethods; end
module ActiveStorage::Reflection; end

module ActiveStorage::Reflection::ActiveRecordExtensions
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveStorage::Reflection::ActiveRecordExtensions::ClassMethods
end

module ActiveStorage::Reflection::ActiveRecordExtensions::ClassMethods
  def reflect_on_all_attachments; end
  def reflect_on_attachment(attachment); end
end

class ActiveStorage::Reflection::HasManyAttachedReflection < ::ActiveRecord::Reflection::MacroReflection
  def macro; end
end

class ActiveStorage::Reflection::HasOneAttachedReflection < ::ActiveRecord::Reflection::MacroReflection
  def macro; end
end

module ActiveStorage::Reflection::ReflectionExtension
  def add_attachment_reflection(model, name, reflection); end

  private

  def reflection_class_for(macro); end
end

class ActiveStorage::Service
  extend ::ActiveSupport::Autoload

  def delete(key); end
  def delete_prefixed(prefix); end
  def download(key); end
  def download_chunk(key, range); end
  def exist?(key); end
  def headers_for_direct_upload(key, filename:, content_type:, content_length:, checksum:); end
  def name; end
  def name=(_arg0); end
  def open(*args, **options, &block); end
  def public?; end
  def update_metadata(key, **metadata); end
  def upload(key, io, checksum: T.unsafe(nil), **options); end
  def url(key, **options); end
  def url_for_direct_upload(key, expires_in:, content_type:, content_length:, checksum:); end

  private

  def content_disposition_with(filename:, type: T.unsafe(nil)); end
  def instrument(operation, payload = T.unsafe(nil), &block); end
  def private_url(key, expires_in:, filename:, disposition:, content_type:, **_arg5); end
  def public_url(key, **_arg1); end
  def service_name; end

  class << self
    def build(configurator:, name:, service: T.unsafe(nil), **service_config); end
    def configure(service_name, configurations); end
  end
end

class ActiveStorage::Service::Configurator
  def initialize(configurations); end

  def build(service_name); end
  def configurations; end

  private

  def config_for(name); end
  def resolve(class_name); end

  class << self
    def build(service_name, configurations); end
  end
end

class ActiveStorage::Service::Registry
  def initialize(configurations); end

  def fetch(name); end

  private

  def configurations; end
  def configurator; end
  def services; end
end

module ActiveStorage::SetBlob
  extend ::ActiveSupport::Concern

  private

  def set_blob; end
end

module ActiveStorage::SetCurrent
  extend ::ActiveSupport::Concern
end

module ActiveStorage::SetHeaders
  extend ::ActiveSupport::Concern

  private

  def set_content_headers_from(blob); end
end

module ActiveStorage::Transformers
  extend ::ActiveSupport::Autoload
end

class ActiveStorage::Transformers::Transformer
  def initialize(transformations); end

  def transform(file, format:); end
  def transformations; end

  private

  def process(file, format:); end
end

class ActiveStorage::UnpreviewableError < ::ActiveStorage::Error; end
class ActiveStorage::UnrepresentableError < ::ActiveStorage::Error; end
module ActiveStorage::VERSION; end
ActiveStorage::VERSION::MAJOR = T.let(T.unsafe(nil), Integer)
ActiveStorage::VERSION::MINOR = T.let(T.unsafe(nil), Integer)
ActiveStorage::VERSION::STRING = T.let(T.unsafe(nil), String)
ActiveStorage::VERSION::TINY = T.let(T.unsafe(nil), Integer)

class ActiveStorage::Variant
  def initialize(blob, variation_or_variation_key); end

  def blob; end
  def content_type(*_arg0, &_arg1); end
  def content_type_for_serving(*_arg0, &_arg1); end
  def download(&block); end
  def filename; end
  def forced_disposition_for_serving; end
  def image; end
  def key; end
  def processed; end
  def service(*_arg0, &_arg1); end
  def service_url(*args, &block); end
  def url(expires_in: T.unsafe(nil), disposition: T.unsafe(nil)); end
  def variation; end

  private

  def process; end
  def processed?; end
end

class ActiveStorage::VariantRecord < ::ActiveStorage::Record
  include ::ActiveStorage::VariantRecord::GeneratedAttributeMethods
  include ::ActiveStorage::VariantRecord::GeneratedAssociationMethods

  def autosave_associated_records_for_blob(*args); end

  class << self
    def __callbacks; end
    def _reflections; end
    def _validators; end
    def defined_enums; end
  end
end

module ActiveStorage::VariantRecord::GeneratedAssociationMethods
  def blob; end
  def blob=(value); end
  def build_blob(*args, &block); end
  def create_blob(*args, &block); end
  def create_blob!(*args, &block); end
  def reload_blob; end
end

module ActiveStorage::VariantRecord::GeneratedAttributeMethods; end

class ActiveStorage::VariantWithRecord
  def initialize(blob, variation); end

  def blob; end
  def download(*_arg0, &_arg1); end
  def image; end
  def key(*_arg0, &_arg1); end
  def process; end
  def processed; end
  def processed?; end
  def service_url(*args, &block); end
  def url(*_arg0, &_arg1); end
  def variation; end

  private

  def create_or_find_record(image:); end
  def record; end
  def transform_blob; end
end

class ActiveStorage::Variation
  def initialize(transformations); end

  def content_type; end
  def default_to(defaults); end
  def digest; end
  def format; end
  def key; end
  def transform(file, &block); end
  def transformations; end

  private

  def transformer; end

  class << self
    def decode(key); end
    def encode(transformations); end
    def wrap(variator); end
  end
end
