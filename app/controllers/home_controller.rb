class HomeController < ApplicationController
  before_action :require_login
  
  def index
    @posts = Post.all.reverse
  end

  def upload
    # 게시글 업로드
    new_post = Post.new
    new_post.email = params[:email]
    new_post.title = params[:title]
    new_post.content = params[:content]
    new_post.user = current_user
    
    # 이미지 파일 업로드
    file = params[:file]
    uploader = UploadUploader.new
    uploader.store!(file)
    
    # 파일 경로 저장
    new_post.file_name = uploader.url
    new_post.save
    
    redirect_to "/home/index"
  end

  def reply
  end
end