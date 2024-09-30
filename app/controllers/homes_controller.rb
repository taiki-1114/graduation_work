class HomesController < ApplicationRecord
    #422エラーメッセージ用のコントトーラーです。
    def index
        raise ActiveRecord::RecordNotSaved
    end
end