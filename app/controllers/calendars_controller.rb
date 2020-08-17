class CalendarsController < ApplicationController

  # １週間のカレンダーと予定が表示されるページ
  def index
    get_week #「getWeek」だったものを変えた
    @plan = Plan.new #合ってる
  end


  # 予定の保存
  def create
    Plan.create(plan_params) #プライベートメソッドの呼び出し
    redirect_to action: :index #リダリレクト先（action/indexアクション）を読み込む
  end


  private#以下プライベートメソットになる

  def plan_params
    params.require(:plan).permit(:date, :plan) #特定のキーを受け取るように制限（ストロングパラメーター）
  end

  def get_week #「getWeek」だったものを変えた
    wdays = ['(日)','(月)','(火)','(水)','(木)','(金)','(土)']

    # Dateオブジェクトは、日付を保持しています。下記のように`.today.day`とすると、今日の日付を取得できます。
    @todays_date = Date.today
    # 例)　今日が2月1日の場合・・・ Date.today.day => 1日

    @week_days = []

    @plans = Plan.where(date: @todays_date..@todays_date + 7)

    7.times do |x|
      plans = []
      plan = @plans.map do |plan|
        plans.push(plan.plan) if plan.date == @todays_date + x
      end
      days = { month: (@todays_date + x).month, date: (@todays_date+x).day, plans: plans}
      @week_days.push(days)
    end

  end
end
