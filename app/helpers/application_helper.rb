module ApplicationHelper
#rubocop:disable all
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to post_like_path(id: like.id, post_id: post.id), method: :delete do
        content_tag(:span, class:"container") do
          tag2 = content_tag(:span, "#{post.likes.size}", class:"post-counter")
          tag = content_tag(:span, "\u{1F44E}", class:"post-like")
          (tag2  + tag ).html_safe
        end
      end
    else
      link_to post_likes_path(post_id: post.id), method: :post do
        content_tag(:span, class:"container") do
          tag3 = content_tag(:span, "#{post.likes.count}", class:"post-counter")
          tag1 = content_tag(:span, "\u{1F44D}", class:"post-like")
          (tag3 +tag1).html_safe
        end
      end
    end
  end

  def pending_friendships
    start = false
    Friendship.all.each do |a|
      if a.confirmed == false && current_user.id == a.user_id
        start = true
      end
    end
  end

  def incoming_friendships
    current_user.friendships.each do |a|
      if a.confirmed == false && current_user.id = a.user_id
        true
      end
    end
  end

  def already_sent_request_or_friends(current_user)
    a = Friendship.where('confirmed =?', false).pluck(:friend_id, :user_id).flatten
    b = Friendship.where('confirmed =?', true).pluck(:friend_id, :user_id).flatten
    if a.include?(current_user.id) || b.include?(current_user.id)
      true
    else
      false
    end
  end

  def already_friends(current_user)
    b = Friendship.where('confirmed =?', true).pluck(:friend_id, :user_id).flatten
    if b.include?(current_user.id)
      true
    else
      false
    end
  end

  def delete_friend(friend)
    @friendships = Friendship.where('friend_id =? or user_id =? AND user_id =? or friend_id =?', current_user.id, friend.id, current_user.id, friend.id)
    if delete_friend(friend)
      @friendships.delete_all
    end
  end
end
