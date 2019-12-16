require 'rails_helper'

RSpec.describe 'Admin', type: :system do
  let(:user) { create :user }
  let(:admin_user) { create :user, :admin }
  let(:result) { create :result }
  let(:result_over_90) { create :result, :over_90 }
  before do
    visit admin_login_path
    fill_in 'email', with: admin_user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
  end
  describe '管理画面' do
    context 'ユーザー一覧からユーザーを削除' do
      it 'ユーザー一覧にリダイレクトされて「ユーザーを削除しました」とフラッシュメッセージが表示される', js: true do
        user
        within '.sidebar' do
          click_on 'ユーザー一覧'
        end
        within "#user-#{user.id}" do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq admin_users_path
        expect(page).to have_content 'ユーザーを削除しました'
      end
    end

    context 'ユーザー一覧で名前の検索フォームに「userの名前」を入力して検索' do
      it '検索結果に「userの名前」が表示されていること、「admin_userの名前」が表示されていないことを検証する', js: true do
        user
        within '.sidebar' do
          click_on 'ユーザー一覧'
        end
        fill_in 'q[name_cont]', with: "#{user.name}"
        click_on '検索'
        expect(page).to have_selector '.table-striped', text: "#{user.name}"
        expect(page).to_not have_selector '.table-striped', text: "#{admin_user.name}"
      end
    end

    context '検証結果一覧から検証結果を1つ削除' do
      it '検証結果一覧にリダイレクトされて「検証結果を削除しました」とフラッシュメッセージが表示される', js: true do
        result
        within '.sidebar' do
          click_on '検証結果一覧'
        end
        within "#result-#{result.id}" do
          click_on '削除'
        end
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq admin_results_path
        expect(page).to have_content '検証結果を削除しました'
      end
    end

    context '検証結果一覧の検索フォームで、下限値「90」と上限値「100」を入力して検索' do
      it '検索結果に「95のスコアを持つ検証結果(result_over_90)」が表示されていること、「80のスコアを持つ検証結果(result)」が表示されていないこと」を検証する', js: true do
        result
        result_over_90
        within '.sidebar' do
          click_on '検証結果一覧'
        end
        fill_in 'q[score_gteq]', with: '90'
        fill_in 'q[score_lteq]', with: '100'
        click_on '検索'
        expect(page).to have_selector "#result-#{result_over_90.id}", text: "#{result_over_90.score}"
        expect(page).to_not have_selector "#result-#{result.id}", text: "#{result.score}"
      end
    end

    context 'メッセージ一覧から「編集」ボタンをクリックして、編集画面でメッセージを編集し「更新」をクリック' do
      it 'メッセージ一覧にリダイレクトされて「メッセージを更新しました」とフラッシュメッセージが表示される', js: true do
        within '.sidebar' do
          click_on 'メッセージ一覧'
        end
        within '#message-10' do
          click_on '編集'
        end
        fill_in 'message[advice]', with: '女装メイクや写真の撮り方を工夫してみましょう！！！'
        click_on '更新'
        expect(page).to have_content 'メッセージを更新しました'
      end
    end
  end
end
