require 'aws-sdk-core/s3'
require 'fileutils'

class DownloadsController < ApplicationController
  before_action :set_download, only: [:show, :edit, :update, :destroy]

  # GET /downloads
  # GET /downloads.json
  def index
    @downloads = Download.all
  end

  # GET /downloads/:filename
  def show
    not_found if @download.nil?

    s3client = Aws::S3::Client.new()
    s3obj = Aws::S3::Object.new(ENV['S3_DOWNLOADS_BUCKET'], @download.filename, client: s3client)
    resp = s3obj.get

    FileUtils.mkdir_p(Rails.root.join('tmp', 'downloads'))

    cached_filename = Rails.root.join('tmp', 'downloads', @download.filename)

    File.open(cached_filename, 'wb') do |file|
      file.write resp.body.read
    end

    send_file cached_filename
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_download
      @download = Download.find_by(filename: params[:id])
    end
end
