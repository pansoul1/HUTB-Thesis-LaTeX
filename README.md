# 湖南工商大学本科毕业论文（设计）LaTeX 模板

[![](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![](https://img.shields.io/badge/XeLaTeX-passing-brightgreen.svg)]()

适用于 **湖南工商大学（HUTB）** 本科毕业论文（设计）的 LaTeX 模板，格式严格遵循《湖南工商大学本科生毕业论文（设计）撰写规范》。

> **适用范围**：本模板的章节结构主要面向 **工科/计算机类专业的毕业设计**（含系统设计、实现、测试等章节）。其他专业的同学可以根据自己的论文结构调整 `chapter/` 下的章节文件，`csuthesis.cls` 样式类和格式规范对所有专业通用。

## 模板特性

- 扉页、原创性声明、知识产权授权声明自动生成
- 中英文摘要、目录、图表目录自动排版
- 页眉页脚自动设置（正文："湖南工商大学毕业论文（设计）"/ "第 X 页 共 Y 页"）
- 参考文献格式符合 GB/T 7714-2015 国家标准
- 章节编号、图表编号、公式编号、脚注格式均已预设
- 支持附录、致谢等非正文部分

## 格式规范摘要

| 项目 | 规范 |
|------|------|
| 纸张 | A4 |
| 页边距 | 上30mm、下25mm、左30mm、右20mm |
| 正文字体 | 小四号宋体，行间距固定值22磅 |
| 一级标题 | 黑体四号加粗，编号 `1.` `2.` `3.` |
| 二级标题 | 宋体小四号加粗，编号 `1.1` `1.2` |
| 三级标题 | 宋体小四号，编号 `1.1.1` `1.1.2` |
| 图表标题 | 五号宋体加粗，全文顺序编号 |
| 参考文献 | GB/T 7714-2015，不少于10条 |
| 论文字数 | 毕业论文≥12000字，毕业设计≥15000字 |

## 项目结构

```
├── main.tex              # 主入口文件（修改个人信息从这里开始）
├── csuthesis.cls          # 论文样式类（一般无需修改）
├── references.bib         # 参考文献（在此添加你的文献条目）
├── chapter/
│   ├── abstract.tex       # 摘要（中英文）
│   ├── chap01.tex         # 第1章 绪论
│   ├── chap02.tex         # 第2章 相关技术介绍
│   ├── chap03.tex         # 第3章 系统设计与实现
│   ├── chap04.tex         # 第4章 总结与展望
│   ├── apendix.tex        # 附录
│   └── thank.tex          # 致谢
├── images/                # 图片资源目录
│   └── fm.png             # 校徽横幅（扉页使用）
├── compile.bat / .sh      # 编译脚本
└── clean.bat / .sh        # 清理中间文件
```

## 快速开始

### 1. 环境准备

安装 TeX 发行版（二选一）：

- **Windows**: [MiKTeX](https://miktex.org/) 或 [TeX Live](https://tug.org/texlive/)
- **macOS/Linux**: [TeX Live](https://tug.org/texlive/)

> **MiKTeX 离线下载**：如果官网下载速度慢，可以使用云盘链接：[basic-miktex-25.12-x64.exe](https://cloud.pansoul.cloud/d/%E8%AF%BE%E5%A0%82/basic-miktex-25.12-x64.exe?sign=kD1TM6vhOJVRPt3RxPn04l28PlOIjhKColh9ZmvLVSY=:0)

⚠️ **安装后务必检查环境变量**：

安装 MiKTeX 后，需要确保 `xelatex` 和 `biber` 命令能在终端中正常运行。打开 CMD 或 PowerShell，输入：

```bash
xelatex --version
biber --version
```

如果提示"不是内部或外部命令"，说明 MiKTeX 没有加入系统环境变量，需要手动配置：

1. 找到 MiKTeX 安装目录下的 `bin` 文件夹（默认路径：`C:\Users\你的用户名\AppData\Local\Programs\MiKTeX\miktex\bin\x64\`）
2. 右键"此电脑" → 属性 → 高级系统设置 → 环境变量
3. 在"系统变量"或"用户变量"中找到 `Path`，点击编辑，新建一行，粘贴上面的 `bin` 路径
4. 确定保存，**重新打开终端**再试

> **注意**：系统必须安装以下中文字体：**宋体（SimSun）**、**黑体（SimHei）**、**华文新魏（STXinwei）**，以及英文字体 **Times New Roman**。Windows 系统一般自带这些字体。

### 2. 选择论文类型

在 `main.tex` 顶部选择你的论文类型（二选一）：

```latex
\thesistype{毕业设计}       % ← 毕业设计（默认）
% \thesistype{毕业论文}     % ← 毕业论文
```

该选项会影响：
- 扎页大标题（显示“毕业设计”或“毕业论文”）
- 正文页眉（显示“湖南工商大学毕业设计”或“湖南工商大学毕业论文”）

### 3. 填写个人信息

编辑 `main.tex` 中的个人信息：

```latex
\studentid{20210101001}          % 学号
\titlecn{你的论文中文题目}         % 中文标题
\titleen{English Title}          % 英文标题
\author{你的姓名}                 % 姓名
\priormajor{你的专业}             % 专业
\supervisor{指导教师姓名}          % 指导教师
\supervisortitle{教授}            % 职称
\department{你的学院}             % 学院
\classname{专业班级2101}           % 班级
\defensedate{2025年6月}           % 答辩日期
```

### 4. 编写论文内容

在 `chapter/` 目录下的各 `.tex` 文件中编写对应章节内容。每个文件都包含格式提示和示例代码。

如果需要增加章节，创建新的 `chapter/chapXX.tex` 文件，并在 `main.tex` 中添加 `\input{chapter/chapXX.tex}`。

### 5. 管理参考文献

在 `references.bib` 中添加文献条目，正文中使用 `\cite{key}` 引用。

### 6. 编译论文

**直接运行编译脚本即可，脚本会自动完成全部四步编译**，无需手动多次运行：

```bash
compile.bat          # Windows 双击运行
bash compile.sh      # macOS/Linux
```

编译成功后生成 `main.pdf`。

> **为什么需要四步？** 编译脚本内部执行了 `xelatex → biber → xelatex → xelatex` 四步流程：
>
> | 步骤 | 命令 | 作用 |
> |------|------|------|
> | 1/4 | `xelatex main.tex` | 首次编译，收集引用标记和标签，生成 `.aux` 文件 |
> | 2/4 | `biber main` | 读取 `.bib` 文件，处理参考文献，生成 `.bbl` |
> | 3/4 | `xelatex main.tex` | 插入参考文献列表，解析 `\cite{}` 引用编号 |
> | 4/4 | `xelatex main.tex` | 解决交叉引用（页码、目录、插图索引、表格索引） |
>
> 如果只运行一次 `xelatex`，会出现引用显示为 **[?]**、目录页码错误等问题。**使用编译脚本就不用担心这些**。

清理中间文件：

```bash
clean.bat            # Windows
bash clean.sh        # macOS/Linux
```

## 常用 LaTeX 语法速查

### 插入单张图片

```latex
% 步骤：将图片放入 images/ 目录，然后：
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{images/your_image.png}
    \caption{图片标题}
    \label{fig:your_label}
\end{figure}
% 引用：如图\ref{fig:your_label}所示
```

> **参数说明**：`[htbp]` 为浮动位置（h=当前位置, t=页顶, b=页底, p=独立页），`width=0.8\textwidth` 为图片宽度占页面的80%。

### 插入并排图片

```latex
\begin{figure}[htbp]
    \centering
    \subfigure[左图标题]{
        \includegraphics[width=0.45\textwidth]{images/left.png}
        \label{fig:left}
    }
    \subfigure[右图标题]{
        \includegraphics[width=0.45\textwidth]{images/right.png}
        \label{fig:right}
    }
    \caption{总图标题}
    \label{fig:both}
\end{figure}
% 引用子图：如图\ref{fig:left}所示
% 引用总图：如图\ref{fig:both}所示
```

### 插入表格（三线表）

```latex
\begin{table}[htbp]
    \centering
    \caption{表格标题}
    \label{tab:your_label}
    \begin{tabular}{lll}
        \toprule
        列1 & 列2 & 列3 \\
        \midrule
        数据1 & 数据2 & 数据3 \\
        数据4 & 数据5 & 数据6 \\
        \bottomrule
    \end{tabular}
\end{table}
```

### 插入公式

```latex
\begin{equation}
    E = mc^2
    \label{eq:your_label}
\end{equation}
% 引用：如公式(\ref{eq:your_label})所示
```

### 引用参考文献

```latex
相关研究表明\cite{example_article}，该方法具有较好的效果。
```

### 插入代码

```latex
\begin{verbatim}
def hello():
    print("Hello, World!")
\end{verbatim}
```

## 常见问题

**Q: 编译报错找不到字体？**
A: 确保系统安装了宋体、黑体、华文新魏和 Times New Roman。Windows 系统一般自带，macOS/Linux 可能需要手动安装。

**Q: 参考文献没有显示？**
A: 确保执行了完整的四步编译流程（xelatex → biber → xelatex → xelatex），且 `references.bib` 中的文献在正文中被 `\cite{}` 引用过。

**Q: 如何调整章节数量？**
A: 在 `chapter/` 下创建新的 `.tex` 文件，然后在 `main.tex` 的对应位置添加 `\input{chapter/新文件.tex}`。

**Q: 图表编号想按章节编号（如图1.1）而不是全文顺序编号？**
A: 本模板遵循学校规范采用全文顺序编号。如需修改，请在 `csuthesis.cls` 中调整 `\thefigure` 和 `\thetable` 的定义。

## 致谢

本模板基于湖南工商大学本科生毕业论文（设计）撰写规范制作。

## License

MIT License
