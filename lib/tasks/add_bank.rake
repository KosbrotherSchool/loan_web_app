namespace :add_bank do

	task :add_bank_seeds => :environment do

		Bank.create(name:"兆豐銀行",icon_link:"https://www.megabank.com.tw/images/web_icon.ico")
		Bank.create(name:"渣打銀行",icon_link:"https://www.sc.com/global/assets/favicon.ico")
		Bank.create(name:"台新銀行",icon_link:"https://www.taishinbank.com.tw/cs/resources/zh-tw/images/tsb.ico")
		Bank.create(name:"台北富邦",icon_link:"http://www.lia-roc.org.tw/index01/data/fu.jpg")
		Bank.create(name:"遠東銀行",icon_link:"https://lh6.ggpht.com/zvRP6sGy_oBdzagDMkgnmZkTF9KRtof933Mdqq_7wSVVFlLYiheZWbPjM2D7Akmnccc=w300")
		Bank.create(name:"匯豐銀行",icon_link:"http://www.lessouriresdemanille.com/images/hsbc_logo.jpg")
		Bank.create(name:"星展銀行",icon_link:"http://www.praisage.com/upload/brand/logo/00000000104.jpg")
		Bank.create(name:"澳盛銀行",icon_link:"http://anz.tw/zh/images/favicon.ico")
		Bank.create(name:"新光人壽",icon_link:"http://www.skl.com.tw/Images/BrowserLogo.ico")
		Bank.create(name:"富邦人壽",icon_link:"http://www.lia-roc.org.tw/index01/data/fu.jpg")
		Bank.create(name:"合作金庫",icon_link:"http://wiki.mbalib.com/w/images/e/e7/Taiwan_Cooperative_Bank_logo.jpg")
		Bank.create(name:"三商美邦人壽",icon_link:"http://www.mli.com.tw/MLI_Public/Mli.ico")
		Bank.create(name:"台灣銀行",icon_link:"http://profile.ak.fbcdn.net/hprofile-ak-snc4/41594_134158079939380_4923_n.jpg")
		Bank.create(name:"彰化銀行",icon_link:"http://2013mofrun.eyelive.com.tw/images/logo-chb.gif")
		Bank.create(name:"第一銀行",icon_link:"https://www.firstbank.com.tw/favicon.ico")
		Bank.create(name:"台中商銀",icon_link:"https://lh6.ggpht.com/b0Hlvv1nPXJr-WfQZcPDsgpStFNmJ6AvNNdoBiocMfnriP4x0DMrYSIlCwmNSMenDg=w300")
		Bank.create(name:"台灣中小企銀",icon_link:"http://www.survision.com.tw/pimage/20080923142700032.gif")
		Bank.create(name:"全國農業金庫",icon_link:"http://www.ctgo.org.tw/upload/afver_area/20109917343.jpg")
		Bank.create(name:"上海銀行",icon_link:"https://lh5.googleusercontent.com/-_I8VDGdUeKQ/ULiub6O9S3I/AAAAAAAAABk/rBZuxiKfvek/s150-c/photo.jpg")
		Bank.create(name:"元大銀行",icon_link:"http://www.cardu.com.tw/image_upload/bank/20121223191848.png")
		Bank.create(name:"華南銀行",icon_link:"http://quot.tw/images/dminer_ex2.jpg")
		Bank.create(name:"土地銀行",icon_link:"http://www.landbank.com.tw/obj_logo.ico")
		Bank.create(name:"玉山銀行",icon_link:"http://www.worklohas.com/index/images/solution_2.png")

	end

	task :add_bank_products_seeds => :environment do

		bp = BankProduct.new
		bp.bank_id = 1
		bp.title = "青年安心成家方案"
		bp.interest = "二段式 第1~24期 1.72% 機動利率 第25期起 2.02% 機動利率"
		bp.binding = "2年"
		bp.break_money = "第一年 1% 第二年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。 *每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "https://www.megabank.com.tw/news/news_01.asp?kind=1&sno=481&channel=F190"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 1
		bp.title = "歡喜理財家房貸專案"
		bp.interest = "一段式 1.88% 機動利率"
		bp.binding = "2年"
		bp.break_money = "第一年 1% 第二年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = ""
		bp.link = "https://www.megabank.com.tw/personal/personal03_20.asp"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 2
		bp.title = "指數型房貸"
		bp.interest = "二段式 1.95% 機動利率"
		bp.binding = "2年"
		bp.break_money = "第一年 1.5% 第二年 1%"
		bp.grace_year = "一年"
		bp.portion = "最高八成"
		bp.other_info = ""
		bp.link = "https://www.sc.com/tw/borrow/mortgage-index.html"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 3
		bp.title = "優惠房貸專案"
		bp.interest = "一段式 1.9% 機動利率" 
		bp.binding = "3年"
		bp.break_money = "第一年 1% 第二年 0.75% 第三年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*小套房、店面需個案評估"
		bp.link = "https://www.taishinbank.com.tw/TS/TS02/TS0203/TS020301/TS02030101/TS0203010101/TS020301010106/index.htm"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 4
		bp.title = "富邦優選房貸"
		bp.interest = "一段式 1.95% 機動利率" 
		bp.binding = "3年"
		bp.break_money = "第一年 1% 第二年 0.75% 第三年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "* 依買賣成交金額另審核利率 * 限購屋自住。"
		bp.link = "https://www.fubon.com/bank/personal/common_loan/common_loan_0.htm"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 5
		bp.title = "指數房貸"
		bp.interest = "一段式 1.98% 機動利率" 
		bp.binding = "2年"
		bp.break_money = "申貸金額 1%"
		bp.grace_year = "無"
		bp.portion = "最高八成"
		bp.other_info = "* 套房、工業住宅需個案評估"
		bp.link = "https://www.feib.com.tw/mortgage/Detail.aspx?id=126"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 6
		bp.title = "一段式傳統型"
		bp.interest = "1.87% 起機動利率" 
		bp.binding = "3年"
		bp.break_money = "第一年 三個月前餘額 2.0% 第二年 三個月前餘額 1.5% 第三年 三個月前餘額 1.0%"
		bp.grace_year = "最長二年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://www.hsbc.com.tw/1/2/personal_zh_TW/cards_rate#ml"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 7
		bp.title = "指數型房貸"
		bp.interest = "一段式 2.25 %起機動利率 " 
		bp.binding = "3年"
		bp.break_money = "違約金為 2 個月月付金×(剩餘期數/36)"
		bp.grace_year = "無"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://www.dbs.com.tw/personal-zh/loans/homeloan/index-type-housing-loan.page"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 8
		bp.title = "一般型房貸"
		bp.interest = "貸款金額 900 萬以上：綁三年 1.92% 機動利率 綁二年 1.97% 機動利率 綁一年 2.07% 機動利率" 
		bp.binding = "1-3年"
		bp.break_money = "第一年 1.5% 第二年 1% 第三年 0.8%"
		bp.grace_year = "最長二年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://anz.tw/zh/personal/homeloan/homeloan-product-3.jsp"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 8
		bp.title = "一般型房貸"
		bp.interest = "貸款金額 900 萬以下：綁三年 1.97% 機動利率 綁二年 2.02% 機動利率 綁一年 2.12% 機動利率" 
		bp.binding = "1-3年"
		bp.break_money = "第一年 1.5% 第二年 1% 第三年 0.8%"
		bp.grace_year = "最長二年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://anz.tw/zh/personal/homeloan/homeloan-product-3.jsp"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 9
		bp.title = "菁優貸房貸專案"
		bp.interest = "一段式 1.87% 機動利率" 
		bp.binding = "3年"
		bp.break_money = "第一年 1.0% 第二年 0.75% 第三年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://www.skl.com.tw/Proc/Loans/HouseProduct.aspx"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 9
		bp.title = "菁優貸房貸專案"
		bp.interest = "二段式 第一年 1.84% 固定利率 第二年起 1.96% 機動利率" 
		bp.binding = "3年"
		bp.break_money = "第一年 1.0% 第二年 0.75% 第三年 0.5%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住一般住宅 *北市新北市小於 12 坪不承作"
		bp.link = "http://www.skl.com.tw/Proc/Loans/HouseProduct.aspx"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 10
		bp.title = "優質房仲"
		bp.interest = "一段式1.86% 機動利率 " 
		bp.binding = "2年"
		bp.break_money = "第一年 1.0% 第二年 0.75%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限「信義房屋」或「永慶房屋」等2家房仲公司之直營店所成交之房屋，且須提供完整之履約保證契約書及買賣合約書 *擔保品需符合下列條件：1. 住宅型不動產須坐落於分區之A、B、C區。2. 工業住宅以坐落於台北市、新北市A區為限。"
		bp.link = "https://www.fubon.com/life/num_debt/002life_loan_02e.htm?show=m6"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 10
		bp.title = "特選房仲"
		bp.interest = "一段式 1.88% 機動利率 " 
		bp.binding = "2年"
		bp.break_money = "第一年 1.0% 第二年 0.75%"
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限「太平洋房屋」、「台灣房屋」、「中信房屋」、「有巢氏房屋」、「永慶不動產」、「台慶不動產」、「群義房屋」、「住商不動產」及「21世紀不動產」等9家房仲公司所成交之房屋，且須提供完整之履約保證契約書或房屋交易安全保證書及買賣合約書；承作履約保證公司限定為一般銀行、安信建經、僑馥建經、第一建經、泛太建經及合泰建經。*擔保品需符合下列條件：1. 住宅型不動產須坐落於分區之A、B、C區。2. 工業住宅以坐落於台北市、新北市A區為限。"
		bp.link = "https://www.fubon.com/life/num_debt/002life_loan_02e.htm?show=m6"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 11
		bp.title = "房屋貸款"
		bp.interest = "一段式 1.95%起機動利率 " 
		bp.binding = "不綁約"
		bp.break_money = "無"
		bp.grace_year = "一年"
		bp.portion = "最高八成"
		bp.other_info = "*借款人經本行評估合格者且擔保品座落地點符合本行規範之區域。"
		bp.link = "https://www.tcb-bank.com.tw/aboutfinance/personal_finance/consumer_intro/Pages/%E6%88%BF%E5%B1%8B%E8%B2%B8%E6%AC%BE.aspx"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 12
		bp.title = "一般專案"
		bp.interest = "前兩年固定1.96%，第三年起機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "1年"
		bp.portion = "最高八成"
		bp.other_info = ""
		bp.link = "http://www.mli.com.tw/MLI_Public/MortgageDefault.aspx?tid=Nav05&mid=Mortgage_1045"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 12
		bp.title = "菁英專案"
		bp.interest = "前兩年固定1.84%，第三年起機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "1年"
		bp.portion = "最高八成"
		bp.other_info = "*限專業人士、公教、及三千大企業員工及知名外商企業或貸款七成以內客戶"
		bp.link = "http://www.mli.com.tw/MLI_Public/MortgageDefault.aspx?tid=Nav05&mid=Mortgage_1045"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 13
		bp.title = "青年安心成家方案"
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://www.bot.com.tw/Business/Loans/ConsumerLoan/Pages/tb3227.aspx"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 13
		bp.title = "青年安心成家方案"
		bp.interest = "一段式 2.264% 機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://www.bot.com.tw/Business/Loans/ConsumerLoan/Pages/tb3227.aspx"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 13
		bp.title = "三段式"
		bp.interest = "第 1~6期 1.994% 機動利率 第 7~12期 2.169% 機動利率 第 13 期起 2.369% 機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = ""
		bp.link = "http://www.bot.com.tw/business/loans/consumerloan/ailine.htm"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 14
		bp.title = "青年首次購屋優惠貸款 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "https://www.chb.com.tw/wps/wcm/connect/web/pBanking/pPrd/pLoan/pLnIntro/pLIntroH3/pLIntroH38/"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 14
		bp.title = "一段式"
		bp.interest = "2.18%起機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "https://www.chb.com.tw/wps/wcm/connect/web/pBanking/pPrd/pLoan/pLnIntro/pLIntroH/pLIntroH1/pLIntroH11/"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 15
		bp.title = "青年安心成家方案 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "不綁約"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=134"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 15
		bp.title = "菁英優利貸款專案"
		bp.interest = "一段式2.05% 機動利率 三段式 第 1~6期 1.94% 機動利率 第 7~12期 1.97% 機動利率 第 13 期起 2.06% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*信用良好具償還能力且符合本專案條件之本國國民"
		bp.link = "https://www.firstbank.com.tw/A2_6_2.action?loanUrl=6501926228d08fe932947a2371b1a9db0eb8e9ed56576657b0b6535aea91289c4afdf0e5921c5965bf8a5711647b1da644c3f426d123a8152d6d459f1f448308"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 15
		bp.title = "一般貸款專案"
		bp.interest = "一段式2.38% 機動利率 三段式 第 1~6期 1.95% 機動利率 第 7~12期 2.15% 機動利率 第 13 期起 2.42% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*凡信用良好，有正當職業，具償還能力之本國國民 *經奉准在國內置產投資之華僑及外僑"
		bp.link = "https://www.firstbank.com.tw/A2_6_2.action?loanUrl=6501926228d08fe932947a2371b1a9db0eb8e9ed56576657b0b6535aea91289c644d5468874937db24e6b30c6e15846980198cf509107b602d6d459f1f448308"
		bp.save


		bp = BankProduct.new
		bp.bank_id = 16
		bp.title = "青年安心成家方案 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "2 年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=142"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 16
		bp.title = "三段式"
		bp.interest = "第 1~6期 1.82% 機動利率 第 7~12期 2.02% 機動利率 第 13 期起 2.2% 機動利率" 
		bp.binding = "2 年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = ""
		bp.link = "https://www.tcbbank.com.tw/PersonalFinance/PersonalFinance_01_01.html"
		bp.save


		bp = BankProduct.new
		bp.bank_id = 17
		bp.title = "青年安心成家方案 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "無"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=148"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 17
		bp.title = "好家園貸款"
		bp.interest = "一段式 2.33%起 機動利率" 
		bp.binding = "無"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*購置住宅(含自建)者最長為30年，餘最長20年。 *限期最長3年。"
		bp.link = "http://www.tbb.com.tw/wps/wcm/connect/TBBInternet/index/personal/b04/b0402/b040210_%E5%A5%BD%E5%AE%B6%E5%9C%92"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 17
		bp.title = "幸福家園貸款"
		bp.interest = "三段式 第 1~6期 2.04% 機動利率 第 7~12期 2.1% 機動利率 第 13 期起 2.3% 機動利率" 
		bp.binding = "無"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*購建房屋最長30年、房屋修繕最長15年，寬限期最長為貸款期限6分之1"
		bp.link = "http://www.tbb.com.tw/wps/wcm/connect/TBBInternet/index/personal/b04/b0402/b040211#"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 18
		bp.title = "青年安心成家方案 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "無"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=149"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 19
		bp.title = "青年安心成家方案 "
		bp.interest = "二段式 第 1~24 期 1.72% 機動利率 第 25 期起 2.02% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*限首戶自住。*每案貸款金額上限 500 萬，超過部份依銀行提供貸款利率。"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=134"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 19
		bp.title = "三段式 "
		bp.interest = "第1年 2.3% 機動利率 第2年 2.45% 機動利率 第3年起 2.55% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*年齡20歲至60歲 *具還款能力且信用正常"
		bp.link = "http://www.scsb.com.tw/content/ind/ind_02_a1.jsp"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 20
		bp.title = "指數型房貨"
		bp.interest = "三段式 第 1~6期 1.85% 機動利率 第 7~12期 1.95% 機動利率 第 13 期起 2.15% 機動利率" 
		bp.binding = "2年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*年齡20歲至60歲 *具還款能力且信用正常"
		bp.link = "http://pip.moi.gov.tw/Net/C-Loan/C1-1.aspx?id=52"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 21
		bp.title = "定儲利率指數"
		bp.interest = "一段式 1.9%起 機動利率" 
		bp.binding = "無"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*年滿20歲，信用良好無不良記錄者。*年齡加計借款期間未滿75歲。"
		bp.link = "http://www.hncb.com.tw/loan/f020101.shtml"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 22
		bp.title = "優質房貸方案"
		bp.interest = "一段式2.22% 機動利率 三段式 第 1~6期 1.99% 機動利率 第 7~12期 2.05% 機動利率 第 13 期起 2.32% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*有固定職業，且提供文件證明借款人年所得80萬元以上或夫妻合併年所得120萬元以上者 *有固定職業，近6個月平均資產達200萬元以上者"
		bp.link = "http://www.landbank.com.tw/webpad/webpad.aspx?EpfJdId9UuAuRw6qeGzZucwmXpE5Bzww"
		bp.save

		bp = BankProduct.new
		bp.bank_id = 23
		bp.title = "指數型房貨"
		bp.interest = "二段式 第 1~24期 2.26% 機動利率 第 25 期起 2.76% 機動利率" 
		bp.binding = "3年"
		bp.break_money = ""
		bp.grace_year = "最長三年"
		bp.portion = "最高八成"
		bp.other_info = "*自住型客戶"
		bp.link = "http://www.esunbank.com.tw/b2c/indexhouse.info"
		bp.save


	end

end
 
