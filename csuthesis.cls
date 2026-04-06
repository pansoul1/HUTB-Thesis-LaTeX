%
% 本模版根据湖南工商研究生学位论文撰写规范创建
% 论文内容依次为：
% 1.封面、扉页；
% 2.学位论文原创性声明和版权使用授权书；
% 3.中文摘要；
% 4.英文摘要；
% 5.目录；
% 6.英文缩略词说明（医学类）；
% 7.符号说明（必要时）；
% 8.论文正文；
% 9.参考文献；
% 10.综述（医学类）；
% 11.附录（必要时）；
% 12.攻读博（硕）士学位期间主要研究成果；
% 13.致谢。
% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{csuthesis}
              [2021/01/26 v1.0l
CSU Thesis class]
\ProcessOptions\relax

% 基于article
\LoadClass[a4paper]{report}

% 相关宏包 %
%---------------------------------------------------------%
\RequirePackage{ifthen}
% 支持中文的 ctex 宏包
% 设置文档默认字体大小为小四号
\RequirePackage[zihao=-4]{ctex}
% 设置标题格式
\RequirePackage{titlesec}
% 设置目录
\RequirePackage{titletoc}
% 设置浮动体的标题
\RequirePackage{caption}
%\RequirePackage{subcaption}
% 管理参考文献
% 设置参考文献样式为 gb7714-2015
% 格式规范 http://writeaid.cnki.net/Reference/RefDesc.aspx
\RequirePackage[style=gb7714-2015, gbpub=false, backend=biber]{biblatex}
% 设置页眉和页脚
\RequirePackage{fancyhdr}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
% 超链接
\RequirePackage{hyperref}
% 取消超链接的方框
\hypersetup{hidelinks}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{bm}
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
\RequirePackage{tabu}
\RequirePackage{threeparttable}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 算法
\RequirePackage{algorithm}
% 三线表格式
\RequirePackage{booktabs}
% 总页数
\RequirePackage{lastpage}
% 脚注每页重新编号
\RequirePackage[perpage]{footmisc}
% tikz用于封面文字定位及架构图绘制
\RequirePackage{tikz}
\usetikzlibrary{arrows.meta, positioning, shapes.geometric, fit}
% 下划线（封面用）
\RequirePackage[normalem]{ulem}
% 自定义关键词
%\RequirePackage{pgfkeys}

% \RequirePackage{calc}

% 页面布局 %
%---------------------------------------------------------%

% a4paper大小 297mm*210mm （忽略）
% 打印区面积 240mm*146mm （忽略）

% 本科规范：上边距30mm，下边距25mm，左边距30mm，右边距20mm
\geometry{top=30mm, bottom=25mm, left=30mm, right=20mm, includefoot}

% Word的磅应该对应latex的像素
% 数值方面差不多就行了，不需要太精确

% 1磅=1/72in，等于0.3527 毫米
% 1pt=1/72.27in
% 1bp=1/72in

% 中文字号表
% 字号 大小（bp） 大小（pt）
% 初号  42  42.15749
% 小初号    36  36.135
% 一号  26  26.09749
% 小一号    24  24.09
% 二号  22  22.08249
% 小二号    18  18.06749
% 三号  16  16.06
% 小三号    15  15.05624
% 四号  14  14.05249
% 小四号    12  12.045
% 五号  10.5    10.53937
% 小五号    9   9.03374
% 六号  7.5 7.52812
% 小六号    6.5 6.52437    
% 七号  5.5 5.52061
% 八号  5   5.01874

% ctex 默认设置的字号和基础行距信息，基础行距是字号的1.2倍
% 初号字体大小 42.15749pt 基础行距 50.58899pt。
% 小初号字体大小 36.135pt 基础行距 43.362pt。
% 一号字体大小 26.09749pt 基础行距 31.31699pt。
% 小一号字体大小 24.09pt 基础行距 28.90799pt。
% 二号字体大小 22.08249pt 基础行距 26.499pt。
% 小二号字体大小 18.06749pt 基础行距 21.68098pt。
% 三号字体大小 16.06pt 基础行距 19.272pt。
% 小三号字体大小 15.05624pt 基础行距 18.06749pt。
% 四号字体大小 14.05249pt 基础行距 16.86299pt。
% 小四号字体大小 12.045pt 基础行距 14.454pt。
% 五号字体大小 10.53937pt 基础行距 12.64725pt。
% 小五号字体大小 9.03374pt 基础行距 10.84048pt。
% 六号字体大小 7.52812pt 基础行距 9.03375pt。
% 小六号字体大小 6.52437pt 基础行距 7.82924pt。
% 七号字体大小 5.52061pt 基础行距 6.62474pt。
% 八号字体大小 5.01874pt 基础行距 6.02249pt。
% ctex使用 \fontsize{⟨size⟩}{⟨base line-skip⟩} 重新设置字体大小和基础行距

% 设置字体
\setmainfont{Times New Roman}  % 设置西文字体
% 重定义ctex定义好的宋体和黑体，以支持伪加粗AutoFakeBold
% 即支持类似word里的给黑体、宋体等中文字体加粗的操作，用\bfseries \textbf{text}
% 可以设置加粗程度，这里设置 AutoFakeBold=1 有一点加粗效果，字体太粗会显得字体变大了
\let\songti\relax
\newCJKfontfamily[song]\songti{SimSun}[AutoFakeBold=1]
\let\heiti\relax
\newCJKfontfamily[hei]\heiti{SimHei}[AutoFakeBold=1]
%\newCJKfontfamily[kai]\kaishu{KaiTi}[AutoFakeBold=1]
% 协议页的标题按模板是华文新魏
\newCJKfontfamily[huawenxinwei]\hwxw{STXinwei}[AutoFakeBold=0]
\setCJKmainfont{SimSun}[BoldFont=SimHei] % 设置中文字体为宋体，粗体使用黑体字体

% 关于word的行距（单倍行距、固定值）的相关介绍，请看 https://zhuanlan.zhihu.com/p/35869432
% 关于latex的行距介绍，请看 https://zhuanlan.zhihu.com/p/56127244

% 正文是小四号字体，行间距固定值22磅（本科规范）
% 22bp ≈ 22.08pt ≈ 小四号基础行距14.454pt * 1.528
\renewcommand\baselinestretch{1.528}
\linespread{1.528}\selectfont

% 定制titlepage
% 定义命令和定义相应的宏。
%----------------------------------------------------------------------%
% 以下定义封面相关命令和相应的宏，以titleen为例，\titleen为实际在源码中使用的命令，一旦执行就会因为\gdef\@titleen{#1}使得其产生一个\@titleen的宏，而该宏能够在后续的环境中使用。
\DeclareRobustCommand*\titlecn[1]{\gdef\@titlecn{#1}}                   % 中文标题
\def\@titlecn{\@latex@error{No \noexpand\titlecn given}\@ehc}
\newcommand*\titleen[1]{\gdef\@titleen{#1} \gdef\@title{#1}}            % 英文标题
\newcommand*{\defensedate}[1]{\gdef\@defensedate{#1}} % 答辩日期
\newcommand*{\priormajor}[1]{\gdef\@priormajor{#1}}                     % 一级学科（学科专业）
\newcommand*{\department}[1]{\gdef\@department{#1}}                     % 二级培养单位(学院)
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}}                     % 导师
\newcommand*{\studentid}[1]{\gdef\@studentid{#1}}                       % 学号
\newcommand*{\clcnumber}[1]{\gdef\@clcnumber{#1}}                       % 分类号 Chinese Library Classification
\newcommand*{\schoolcode}[1]{\gdef\@schoolcode{#1}}                     % 学校代码
\newcommand*{\secret}[1]{\gdef\@secret{#1}}                             % 密级
\newcommand*{\classname}[1]{\gdef\@classname{#1}}                         % 专业班级
\newcommand*{\supervisortitle}[1]{\gdef\@supervisortitle{#1}}             % 导师职称
\newcommand*{\thesistype}[1]{\gdef\@thesistype{#1}}                         % 论文类型（毕业论文/毕业设计）
\thesistype{毕业设计}  % 默认为毕业设计，可在 main.tex 中修改

\def\equationautorefname{公式}%
\def\footnoteautorefname{脚注}%
\def\itemautorefname{项}%
\def\figureautorefname{图}%
\def\subfigureautorefname{图}%
\def\tableautorefname{表}%
\def\partautorefname{篇}%
\def\appendixautorefname{附录}%
\def\chapterautorefname{章}%
\def\sectionautorefname{节}%
\def\subsectionautorefname{小小节}%
\def\subsubsectionautorefname{subsubsection}%
\def\paragraphautorefname{段落}%
\def\subparagraphautorefname{子段落}%
\def\FancyVerbLineautorefname{行}%
\def\theoremautorefname{定理}%


% 使 \cleardoublepage 起作用
\renewcommand{\cleardoublepage}{%
	\clearpage
	\ifodd\c@page
	\else
		\hbox{}
		\newpage
	\fi
}
% 1. 封面、扉页%
%-----------------------------------------------------------------------------------------------------------%

% 封面 %
% -------------------------------------------------------------%
% 学位论文封面格式分为公开学位论文（学术学位）、公开学位论文（专业学位）、涉密学位论文（学术学位）、涉密学位论文（专业学位）等四种形式（具体见样例1-4）。
% 封面正面上填写论文题名、学科专业（一级学科或专业学位类别）、学科方向或专业领域、作者姓名、指导教师姓名等内容。在书脊上方印“博（或硕）士学位论文”，下方印“湖南工商大学”。
% 涉密学位论文须在封面右上角标注密级、定密日期，由校保密办公室审批、盖章。
% 盲审判断
\newif\ifblindreview\blindreviewfalse
% 是否是学术学位
\newif\ifacademiccategory\academiccategorytrue
% 以下为公开学位论文（学术）的封面内容
% TODO: 
% - 公开学位论文（专业）
% - 涉密学位论文（学术）
% - 涉密学位论文（专业）

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 定义 \makecoverpage 实现封面的重新绘制
% -----------------------------------------------%
% \newcommand{\makecoverpage} {
% 	\pagestyle{empty}
% 	\noindent
% 	\parbox[b][\textheight][t]{\textwidth}{
% 		\centering
% 		\vspace*{1.5cm}

% 		{\zihao{-2} \heiti \bfseries 硕士学位论文 \par} % 小二号黑体加粗
% 		\vspace{2\baselineskip}
% 		{\zihao{-2} \heiti \bfseries \@titlecn \par} % 小二号黑体加粗
% 		{\zihao{-2}\bfseries \@titleen \par} % 小二号，Times New Roman，加粗
% 		\vspace{\stretch{1}}
% 		{
% 			\renewcommand{\baselinestretch}{1.8}
% 			\zihao{3} \songti \bfseries
% 			\begin{tabular}{l >{\centering\arraybackslash}p{15em}}
% 				\makebox[5em][s]{学科专业} & \@priormajor \\
% 				\ifacademiccategory
% 					\makebox[5em][s]{学科方向} & \@minormajor \\
% 				\else
% 					\makebox[5em][s]{专业领域} & \@minormajor \\
% 				\fi

% 				\ifblindreview
% 				\makebox[5em][s]{研究方向} & \@interestmajor \\
% 				\makebox[5em][s]{学号}    & \@studentid \\
% 				\else
% 				\makebox[5em][s]{作者姓名} & \@author \\
% 				\makebox[5em][s]{指导教师} & \@supervisor \\
% 				\fi
% 			\end{tabular}
% 		}
% 		\par
% 		\vspace{\stretch{1.5}}
% 		{\zihao{-3} \songti 2021年5月 \par}
% 		\vspace{1cm}
% 	}
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 扉页 
% -----------------------------------------------%
% 公开、涉密学位论文扉页采用统一格式，一律不带密级栏，分为学术学位、专业学位两种格式（具体见样例5-6）。
% 扉页除包含封面正面的全部内容外，还应包括中图分类号、UDC、学校代码、学位类别（专业学位或学术学位）、副题名（必要时）、研究方向、二级培养单位、副指导教师（必要时）、以及论文答辩日期和答辩委员会主席等内容。
% 中图分类号（http://www.ztflh.com/）和UDC号（《国际十进位分类法》）可在图书馆查阅获得

\newcommand{\coveruline}[2]{%
	\uline{\makebox[#1][c]{#2}}%
}
\newcommand{\maketitlepage} {
	\pagestyle{empty}
	\clearpage
	\begin{center}
		% 顶部校徽+校名横幅
		\vspace*{0.2cm}
		\includegraphics[width=12cm]{images/fm.png}
		\vspace{1cm}

		% 论文类型大标题（毕业论文 或 毕业设计）
		{\fontsize{40bp}{48bp}\selectfont \heiti \bfseries \@thesistype\par}
		\vspace{1.5cm}

		% 字段表格
		{
			\zihao{3} \heiti
			\renewcommand{\arraystretch}{1.5}
			\begin{tabular}{@{} l @{\hspace{0.5em}} p{9cm} @{}}
				\makebox[4em][s]{题目}  & \uline{\parbox[b]{9cm}{\centering\songti\zihao{3}\@titlecn\strut}} \\
				\makebox[4em][s]{学生姓名} & \coveruline{9cm}{\songti\zihao{3}\@author} \\
				\makebox[4em][s]{学号}  & \coveruline{9cm}{\songti\zihao{3}\@studentid} \\
				\makebox[4em][s]{学院}  & \coveruline{9cm}{\songti\zihao{3}\@department} \\
				\makebox[4em][s]{专业班级} & \coveruline{9cm}{\songti\zihao{3}\@classname} \\
				\makebox[4em][s]{指导教师} & \coveruline{9cm}{\songti\zihao{3}\@supervisor} \\
				\makebox[4em][s]{职称}  & \coveruline{9cm}{\songti\zihao{3}\@supervisortitle} \\
			\end{tabular}
		}
		\vfill

		% 年月
		{\zihao{3} \songti \@defensedate\par}
		\vspace{1cm}
	\end{center}
	\clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. 原创性声明和学位论文版权使用授权书 
% -----------------------------------------------%
% 单独设一页，排在扉页后
% 按模板，标题二号，内容四号，这里学校没有特别强调字体字号，
% 应该有一定自由度。

\newcommand{\announcement}{
	% ====== 第一页：原创性声明 ======
	\clearpage
	\pagestyle{empty}
	\noindent
	\parbox[b][\textheight][t]{\textwidth}{
		\vspace{1cm}
		\begin{center}
			\zihao{3} \heiti \bfseries 湖南工商大学本科毕业论文（设计）原创性声明
		\end{center}
		\vspace{2\baselineskip}
		{
			\zihao{-4} \songti \linespread{1.8}\selectfont
			\hspace{2em}本人郑重声明：所呈交的本科毕业论文（设计）是本人在指导老师的指导下，独立进行研究工作所取得的成果，成果不存在知识产权争议。除文中已经注明引用的内容外，本论文（设计）不含任何其他个人或集体已经发表或撰写过的作品成果。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。\textbf{本人完全意识到本声明的法律结果由本人承担。}
			\par
		}
		\vspace{4\baselineskip}
		{
			\zihao{-4} \songti
			\hspace{2em}作者签名：\par
			\vspace{2\baselineskip}
			\hspace{2em}日期：\makebox[3em][c]{} 年 \makebox[2em][c]{} 月 \makebox[2em][c]{} 日
		}
	}

	% ====== 第二页：知识产权及使用授权声明书 ======
	\clearpage
	\pagestyle{empty}
	\noindent
	\parbox[b][\textheight][t]{\textwidth}{
		\vspace{1cm}
		\begin{center}
			\zihao{3} \heiti \bfseries 湖南工商大学本科毕业论文（设计）知识产权及\\使用授权声明书
		\end{center}
		\vspace{2\baselineskip}
		{
			\zihao{-4} \songti \linespread{1.8}\selectfont
			\hspace{2em}本毕业论文（设计）《\@titlecn》是本人在校期间所完成学业的组成部分，是在学校教师的指导下完成的。因此，本人特授权学校可将本毕业论文（设计）的全部或部分内容输入有关书籍、数据库保存，可采用复制、印刷、网页制作等方式将论文（设计）文本和经过编辑、批注等处理的论文（设计）文本提供给读者查阅、参考，可向有关学术部门和国家有关教育主管部门呈递复印件和电子文件。本毕业论文（设计）无论做何种处理，必须尊重本人的著作权，署明本人姓名。
			\par
		}
		\vspace{4\baselineskip}
		{
			\zihao{-4} \songti
			\begin{tabular*}{\hsize}{@{}l@{\extracolsep{\fill}}r@{}}
				论文(设计) 作者（签字） & 时间\makebox[3em][c]{} 年 \makebox[2em][c]{} 月 \makebox[2em][c]{} 日 \\
			\end{tabular*}
			\vspace{3\baselineskip}
			\begin{tabular*}{\hsize}{@{}l@{\extracolsep{\fill}}r@{}}
				指导教师已阅(签字) & 时间\makebox[3em][c]{} 年 \makebox[2em][c]{} 月 \makebox[2em][c]{} 日 \\
			\end{tabular*}
		}
	}
}

% 中文摘要 %
%---------------------------------------------------------%

% 本科规范：居中打印“内容摘要”四字（黑体四号加粗），空一行打印摘要内容（小四号宋体），行间距22磅
\newenvironment{abstractcn}{
    \clearpage
	\pdfbookmark[0]{中文摘要}{abstractcn}
    \vspace*{-5bp}
    \begin{center}
        \zihao{4}\heiti\bfseries 内容摘要
    \end{center}
    \vspace*{21bp}
    \zihao{-4}\songti
	\linespread{1.528}\selectfont
}{}

% 本科规范：居中打印“ABSTRACT”（Times New Roman四号加粗），空一行打印内容（Times New Roman小四号），行间距22磅
\newenvironment{abstracten}{
	\clearpage
	\pdfbookmark[0]{英文摘要}{abstracten}
    \vspace*{-5bp}
    \begin{center}
        \zihao{4}\textbf{ABSTRACT}
    \end{center}
    \vspace*{21bp}
    \zihao{-4}
	\linespread{1.528}\selectfont
}{}

% 定义作为标题的格式
% \titleformat{command}[shape]%定义标题类型和标题样式
%               {format}%定义标题格式
%               {label}%定义标题的标签，即标题的标号等
%               {sep}%定义标题和标号之间的水平距离
%               {before-code}%定义标题前的内容
%               [after-code]%定义标题后的内容

% 本科规范：一级标题黑体四号加粗，毕业设计编号“1.”“2.”
\renewcommand{\thechapter}{\@arabic\c@chapter}
\newcommand{\chapterlabelforsection}{\@arabic\c@chapter}
\titleformat{\chapter}{\zihao{4} \heiti \bfseries \linespread{1.528}\selectfont}{\thechapter.}{0.5em}{}[]
\titlespacing{\chapter}{0pt}{\baselineskip}{\baselineskip}

% 本科规范：二级标题宋体小四号加粗，编号“1.1”“1.2”
\renewcommand{\thesection}{\chapterlabelforsection.\@arabic\c@section}
\titleformat{\section}{\zihao{-4} \songti \bfseries \linespread{1.528}\selectfont}{\thesection}{0.5em}{}
\titlespacing{\section}{0pt}{0.5\baselineskip}{0.5\baselineskip}

% 本科规范：三级标题宋体小四号，编号“1.1.1”
\titleformat{\subsection}{\zihao{-4} \songti \linespread{1.528}\selectfont}{\thesubsection}{0.5em}{}
% 定义在目录中的格式
% \titlecontents{标题名}
%               [左间距]
%               {标题格式}
%               {标题标志}
%               {无序号标题}
%               {指引线与页码}
%               [下间距]

% 本科规范：“目录”两字居中（黑体三号加粗），两字之间空出两个空格
% 一级目录黑体四号加粗，二级宋体小四号加粗，三级宋体小四号，行间距固定值22磅

\renewcommand{\tableofcontents}{%
	\clearpage
	\pdfbookmark[0]{目录}{tableofcontents}
	\vspace*{-5bp}
	\begin{center}
		\zihao{3} \heiti \bfseries 目\hspace*{1.5em}录
	\end{center}
	\vspace*{21bp}
	\@starttoc{toc}
}

\titlecontents{chapter}
              [2em]
              {\zihao{4}\heiti\bfseries}
              {\contentslabel{2em}}
              {\hspace*{-2em}}
              {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{section}
              [4em]
              {\zihao{-4}\songti\bfseries}
              {\contentslabel{2em}}
              {}
              {\titlerule*[0.5pc]{.}\contentspage}

\titlecontents{subsection}
              [7em]
              {\zihao{-4}\songti}
              {\contentslabel{3em}}
              {}
              {\titlerule*[0.5pc]{.}\contentspage}

% 本科规范：图表标题五号宋体加粗，全文顺序编号（图1、图2、表1、表2）
\DeclareCaptionFont{five}{\zihao{5}}
\renewcommand{\thefigure}{\arabic{figure}}
\captionsetup[figure]{
	format=plain,
	labelsep=quad,
	font={five,bf},    % 五号宋体加粗
	position=bottom
}
% 表格格式
\renewcommand{\thetable}{\arabic{table}}
\captionsetup[table]{
	format=plain,
	labelsep=quad,
	font={five,bf},    % 五号宋体加粗
	position=top
}
% 算法格式
\floatname{algorithm}{算法}
\renewcommand{\thealgorithm}{\arabic{algorithm}}
\captionsetup[algorithm]{
	format=plain,
	labelsep=quad,
	font={five,bf},    % 五号宋体加粗
	position=top
}
% 本科规范：公式全文顺序编号 (1)、(2)、(3)
\renewcommand{\theequation}{\arabic{equation}}

 %注：“参考文献”四字居中用加粗小三号黑体字；空一行左起按顺序依次列出参考文献，将序号置于方括号内，中文小四号宋体字，英文数字使用小四号Times New Roman字体。
%(建议使用顺序编码制) 

% 参考文献格式
% 上空一行居中书写“参考文献”四字(三号黑体加粗，段前18 磅、段后12 磅)，空一行左起按顺序顶格依次列出参考文献
\defbibheading{bibliography}[\bibname]{%
	\clearpage
	\phantomsection % 设置pdf书签跳转到此处
	\markboth{参考文献}{} % 右侧页眉设置为参考文献
	\vspace*{-5bp}
	\begin{center}
		\zihao{3} \heiti \bfseries 参考文献
	\end{center}
	\addcontentsline{toc}{chapter}{参考文献}
	\vspace*{12bp}
}

% 附录
\newcounter{appendix}
\setcounter{appendix}{0}
\newcounter{asection}[appendix]
\setcounter{asection}{0}
\newcounter{asubsection}[asection]
\setcounter{asubsection}{0}
\renewcommand{\theappendix}{附录\Alph{appendix}}
\renewcommand{\theasection}{\Alph{appendix}.\arabic{asection}}
\renewcommand{\theasubsection}{\theasection.\arabic{asubsection}}
\renewcommand{\appendix}[1]{%
	\stepcounter{appendix}
	\chapter*{\theappendix\hspace{0.8em}#1}
	\markboth{\theappendix\quad#1}{}
	\addcontentsline{toc}{chapter}{\theappendix\hspace{0.8em}#1}

	\renewcommand{\thefigure}{\Alph{appendix}-\arabic{figure}}
	\renewcommand{\thetable}{\Alph{appendix}-\arabic{table}}
	\renewcommand{\thealgorithm}{\Alph{appendix}-\arabic{algorithm}}
	\renewcommand{\theequation}{\Alph{appendix}-\arabic{equation}}
}
\newcommand{\asection}[1]{\stepcounter{asection} \section*{\theasection\hspace{0.8em}#1}}
\newcommand{\asubsection}[1]{\stepcounter{asubsection} \subsection*{\theasubsection\hspace{0.8em}#1}}

% 攻读学位期间主要研究成果
% 上空一行居中书写“攻读学位期间主要的研究成果”（三号黑体加粗，段前18 磅、段后12 磅），下空一行左起分类按时间顺序列出作者在攻读学位期间取得的与学位论文相关的研究成果（中文小四号宋体，英文小四号Times New Roman），含参加的研究项目、获奖情况、专利、专著、发表学术论文（含正式录用论文）等，每一条另起一行，开头缩进两个字符，每写一类空一行，发表学术论文中的作者名字需加粗，书写格式参照参考文献格式。
\newcommand{\achievementtitle}{%
	\clearpage
	\phantomsection % 设置pdf书签跳转到此处
	\markboth{在读期间发表的学术论文与取得的其他研究成果}{} % 右侧页眉设置为攻读学位期间主要研究成果
	\vspace*{-5bp}
	\begin{center}
		\zihao{-3} \heiti \bfseries 在读期间发表的学术论文与取得的其他研究成果
	\end{center}
	\addcontentsline{toc}{chapter}{攻读学位期间主要研究成果}
	\vspace*{21bp}
}

% 致谢
% 作者对给予指导、各类资助和协助完成研究工作以及提供各种对论文工作有利条件的单位及个人表示感谢。上空一行居中书写“致谢”（三号黑体加粗），二字中间空两格，段前18磅、段后12 磅，后空一行缩进两个字符书写致谢内容，固定行距20磅。致谢应实事求是，切忌浮夸与庸俗之词。
\newcommand{\thankstitle}{%
	\clearpage
	\phantomsection % 设置pdf书签跳转到此处
	\markboth{致谢}{} % 右侧页眉设置为致谢
	\vspace*{-5bp}
	\begin{center}
		\zihao{3} \heiti \bfseries 致\hspace*{1.5em}谢
	\end{center}
	\addcontentsline{toc}{chapter}{致谢}
	\vspace*{21bp}
}

% 本科规范：脚注格式——每页重新编号，圈码①②③，宋体小五号，单倍行距
\renewcommand{\thefootnote}{\ifcase\value{footnote}\or ①\or ②\or ③\or ④\or ⑤\or ⑥\or ⑦\or ⑧\or ⑨\or ⑩\fi}
\renewcommand{\footnotesize}{\zihao{-5}\songti\linespread{1.0}\selectfont}

% 本科规范：论文题目置于正文之前，黑体三号加粗居中，上下各空一行
\newcommand{\thesistitle}{%
	\vspace*{\baselineskip}
	\begin{center}
		\zihao{3} \heiti \bfseries \@titlecn
	\end{center}
	\vspace*{\baselineskip}
}

% 页眉页脚设置

% 封面、扉页、声明部分：无页眉无页脚
\fancypagestyle{coverpagestyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
}

\newcommand{\frontfrontmatter} {
	\pagestyle{empty}
}

% 前置部分（摘要）：无页眉，页脚罗马数字居中
\fancypagestyle{frontstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{\zihao{-5} \thepage}
}

\newcommand{\frontmatter}{
	\pagestyle{frontstyle}
	\pagenumbering{Roman}
}

% 目录部分：无页眉，罗马数字独立排序
\fancypagestyle{tocstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0pt}
	\fancyfoot[C]{\zihao{-5} \thepage}
}

% 正文部分：页眉居中“湖南工商大学毕业论文（设计）”，页脚“第 X 页 共 Y 页”
\fancypagestyle{mainstyle}{
	\fancyhf{}
	\renewcommand{\headrulewidth}{0.4pt}
	\fancyhead[C]{\zihao{-5} \songti 湖南工商大学\@thesistype}
	\fancyfoot[C]{\zihao{-5} \songti 第 \thepage{} 页 共 \pageref{LastPage} 页}
}
\newcommand{\mainmatter}{
	\pagestyle{mainstyle}
	\pagenumbering{arabic}
}


\newcommand{\fontinfo}[1]{#1 字体大小\f@size pt \quad 基础行距\f@baselineskip \quad 行距缩放\f@linespread \quad 行距\the\baselineskip}
