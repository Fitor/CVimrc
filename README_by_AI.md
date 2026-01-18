# CVim - 一个现代化的 Vim IDE 配置工程

## 概述

CVim 是一个基于 Vundle 插件管理器构建的现代化 Vim IDE 配置工程，集成了多种开发工具和功能，旨在提供高效的代码编辑和项目管理体验。

## 核心特性

### 插件管理
- 使用 **Vundle** 管理插件
- 支持条件加载插件（基于环境变量和可执行文件检测）

### 界面增强
- **vim-startify**: 美观的启动界面
- **nerdtree**: 文件树浏览器
- **lightline.vim**: 可定制的状态栏
- **goyo.vim**: 专注写作模式
- **tabman.vim**: 标签页管理

### 代码编辑
- **nerdcommenter**: 强大的注释功能
- **tabular**: 文本对齐工具
- **vim-surround**: 快速添加/修改包围符号
- **delimitMate**: 自动补全括号、引号等
- **vim-easymotion**: 快速光标移动

### 代码分析
- **taglist.vim**: 源代码浏览器（需 ctags）
- **ale**: 异步语法检查（可选）
- **vim-clang-format**: 代码格式化（需 clang-format）

### 版本控制
- **vim-fugitive**: Git 集成
- **gitgutter**: Git 差异显示

### 搜索与导航
- **ctrlp.vim**: 文件模糊搜索（可选）
- **fzf.vim**: 快速文件查找（可选）
- **mark.vim**: 多词高亮

### 文档与写作
- **DoxygenToolkit.vim**: 文档生成
- **vimwiki**: 个人维基系统
- **calendar-vim**: 日历（可选）

### 代码片段
- **ultisnips** / **vim-snipmate**: 代码片段管理
- **vim-snippets**: 预定义代码片段

### AI 助手（可选）
- **codeium.vim**: 免费 AI 代码补全
- **vim-ollama**: Ollama 集成
- **vim-ai**: AI 助手功能

### 语言支持
- JavaScript、HTML5、Vue、Go、微信小程序等

## 安装与配置

### 前提条件
1. 安装 Vim（版本 8.0+ 推荐）
2. 安装 Git
3. 安装 Vundle：
   ```bash
   git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
   ```

### 安装步骤
1. 克隆 CVim 配置：
   ```bash
   git clone <repository-url> ~/.cvim
   ```

2. 创建符号链接：
   ```bash
   ln -s ~/.cvim/vimrc ~/.vimrc
   ln -s ~/.cvim ~/.vim/cvim
   ```

3. 安装插件：
   打开 Vim 并执行：
   ```vim
   :PluginInstall
   ```

### 项目初始化
1. 在项目根目录执行：
   ```vim
   :CVNew
   ```
   这会创建 `.cvim` 目录和配置文件

2. 编辑项目配置：
   ```vim
   :CVEdit local
   ```

## 基本使用

### 快捷键概览

#### 文件与导航
- `<leader>e` - 切换 NERDTree 文件树
- `<leader>p` - 打开 CtrlP 文件搜索
- `<leader>f` - 打开最近文件
- `<leader>fg` - 在 CVim 根目录搜索文件
- `<leader>ff` - 在当前目录搜索文件
- `<leader>cd` - 切换工作目录

#### 标签页管理
- `<leader>tt` - 切换标签管理器
- `<leader>tn` - 新建标签页
- `<leader>tc` - 关闭当前标签页

#### 搜索
- `<leader>ft` - 在 CVim 根目录 grep 搜索
- `<leader>fr` - 在当前目录 grep 搜索
- `<leader>fu` - CtrlP 函数搜索
- `<leader>fU` - 搜索当前光标下的单词

#### 快速修复
- `<leader>qo` - 打开 quickfix 窗口
- `<leader>qc` - 关闭 quickfix 窗口
- `<leader>qf` - 跳转到第一个错误
- `<leader>qn` - 跳转到下一个错误
- `<leader>qp` - 跳转到上一个错误
- `<leader>ql` - 跳转到最后一个错误

#### 其他功能
- `<leader>g` - 进入专注模式（Goyo）
- `<leader><leader>h/j/k/l` - EasyMotion 快速移动
- `<Tab>` - 触发代码片段（插入模式）
- `<C-J>` - 下一个代码片段占位符
- `<C-K>` - 上一个代码片段占位符

### AI 助手快捷键（如果启用）
- `<leader>ao` - 启用 Codeium
- `<leader>ac` - 禁用 Codeium
- `<leader>aa` - 接受 AI 建议（插入模式）
- `<leader>aj` - 下一个建议
- `<leader>ak` - 上一个建议

### Cscope 快捷键
- `g<C-]>` - 查找符号定义
- `g<C-\>` - 查找引用
- `<C-\>s` - 查找 C 符号
- `<C-\>g` - 查找定义
- `<C-\>c` - 查找调用者
- `<C-\>t` - 查找文本字符串
- `<C-\>e` - 查找 egrep 模式
- `<C-\>f` - 查找文件
- `<C-\>i` - 查找包含文件
- `<C-\>d` - 查找被调用的函数

## 配置选项

### 全局配置
编辑 `~/.vim/cvimrc.vim`：
```vim
:CVEdit global
```

### 项目配置
在项目根目录编辑 `.cvim/cvimrc.vim`：
```vim
:CVEdit local
```

### 可选的插件功能
在配置文件中启用以下功能：

```vim
" AI 助手
let g:cv_ai_assistant_enable = v:true
let g:cv_ai_assistant_plugin = 'codeium'  " 或 'vim-ollama', 'vim-ai'

" 搜索工具
let g:cv_ctrlp_enable = v:true
let g:cv_fzf_enable = v:true

" 代码质量
let g:cv_ale_enable = v:true
let g:cv_clang_format_enable = v:true

" 其他工具
let g:cv_drawit_enable = v:true      " ASCII 绘图
let g:cv_calendar_enable = v:true    " 日历
let g:cv_code_wxapp_enable = v:true  " 微信小程序支持
```

### 路径美化
```vim
let s:homepath = escape($HOME, '/')
let g:cv_pretty_path = {
    \ s:homepath: '~',
    \ '\/path\/to\/project\>': '[PROJECT]',
    \ }
```

## 项目管理

### CVim 命令
- `:CVNew` - 在当前目录初始化 CVim 项目
- `:CVCd` - 切换到 CVim 根目录
- `:CVTcd` - 标签页切换到 CVim 根目录
- `:CVLcd` - 窗口切换到 CVim 根目录
- `:CVEdit [type]` - 编辑配置文件
  - `local` - 项目配置
  - `global` - 全局配置
  - `rg` - ripgrep 配置
  - `cvimrc-template` - 查看配置模板
  - `rgconf-template` - 查看 ripgrep 模板

### 会话管理
CVim 自动集成 vim-startify 的会话管理功能，支持保存和恢复编辑会话。

## 自定义开发

### 添加新插件
1. 编辑 `Vundle_config.vim`
2. 添加 `Plugin 'author/plugin-name'`
3. 创建对应的配置文件在 `configs/` 目录
4. 运行 `:PluginInstall`

### 创建自定义命令
在项目配置文件中添加 Vim 脚本函数和命令映射。

## 故障排除

### 常见问题
1. **插件安装失败**：检查网络连接，确保 Git 可用
2. **快捷键冲突**：检查 `map.vim` 和个人配置
3. **性能问题**：禁用不需要的插件，特别是 AI 相关插件

### 调试
- 使用 `:messages` 查看错误信息
- 检查 `~/.vimrc` 和 `~/.cvim/cvimrc.vim` 的语法
- 临时禁用插件：注释掉 `Vundle_config.vim` 中的对应行

## 贡献与支持

### 文件结构
```
.cvim/
├── Vundle_config.vim      # 插件配置
├── configs/              # 插件配置文件
├── cvim/                 # CVim 核心代码
│   ├── autoload/        # 自动加载函数
│   ├── plugin/          # 插件定义
│   └── colors/          # 颜色方案
├── templates/           # 配置文件模板
└── tools/              # 工具脚本
```

### 报告问题
请在项目仓库中提交 issue，包含：
1. Vim 版本信息
2. 操作系统信息
3. 复现步骤
4. 错误消息

## 许可证

本项目基于 MIT 许可证发布。详细信息请查看 LICENSE 文件。

---

*最后更新：2025年4月*
*维护者：Ci Chen <chen2033@live.com>*

## Vim-AI 插件

### 概述
Vim-AI 是一个功能丰富的 AI 助手插件，支持代码补全、编辑、聊天和自定义提示，可连接多种 AI 后端（OpenAI、DeepSeek、Ollama 等）。

### 安装与配置

#### 1. 启用 Vim-AI
在 `cvimrc.vim` 中添加：
```vim
let g:cv_ai_assistant_enable = v:true
let g:cv_ai_assistant_plugin = 'vim-ai'
```

#### 2. 配置 AI 后端
以 DeepSeek 为例：
```vim
" 配置 vim-ai
let g:cv_vim_ai_config = {}

" 设置 token 文件路径
let g:cv_vim_ai_config.token_file = '~/.config/vim_ai.token'

" 可选：角色配置文件
let g:cv_vim_ai_config.rols_config_file = '~/.config/vim_ai_roles.ini'

" 补全配置
let g:cv_vim_ai_config.complete = {}
let g:cv_vim_ai_config.complete.model = 'deepseek-chat'
let g:cv_vim_ai_config.complete.endpoint_url = 'https://api.deepseek.com/v1/chat/completions'

" 编辑配置
let g:cv_vim_ai_config.edit = {}
let g:cv_vim_ai_config.edit.model = 'deepseek-chat'
let g:cv_vim_ai_config.edit.endpoint_url = 'https://api.deepseek.com/v1/chat/completions'

" 聊天配置
let g:cv_vim_ai_config.chat = {}
let g:cv_vim_ai_config.chat.model = 'deepseek-chat'
let g:cv_vim_ai_config.chat.endpoint_url = 'https://api.deepseek.com/v1/chat/completions'
```

#### 3. 创建 token 文件
```bash
# 创建目录
mkdir -p ~/.config

# 创建 token 文件
echo "your-deepseek-api-key" > ~/.config/vim_ai.token
chmod 600 ~/.config/vim_ai.token
```

### 使用指南

#### 核心功能

##### 1. AI 补全（AIComplete）
在插入模式下触发代码补全：
```vim
" 默认快捷键
<C-X><C-U>    " 触发补全

" 或使用命令
:AIComplete   " 在当前光标位置补全
```

##### 2. AI 编辑（AIEdit）
编辑选中的代码或整个文件：
```vim
" 可视化模式选中文本后
:AIAEdit      " 编辑选中文本

" 编辑整个文件
:%AIAEdit     " 编辑整个文件

" 带提示编辑
:AIAEdit "优化这段代码"   " 根据提示编辑
```

##### 3. AI 聊天（AIChat）
打开聊天窗口进行对话：
```vim
:AIChat       " 打开聊天窗口

" 带初始消息聊天
:AIChat "解释这段代码的工作原理"
```

##### 4. 自定义提示命令
CVim 已集成自定义提示命令：
```vim
" 生成 Git 提交信息
:AIPrompt CommitMessage

" 代码审查（先选中代码）
:'<,'>AIPrompt CodeReview

" 查看可用提示
:AIPrompt <Tab>   " 自动补全提示类型
```

#### 快捷键映射
CVim 已配置的快捷键：
```vim
" 补全相关
" <C-X><C-U>  - 触发 AI 补全

" 编辑相关
" :AIAEdit    - 编辑选中文本或文件

" 聊天相关
" :AIChat     - 打开聊天窗口
```

#### 自定义提示
创建自定义提示函数，编辑 `cvim/autoload/vimai/prompt.vim` 或创建新的提示文件：

示例：添加代码优化提示
```vim
function! s:PromptOptimizeCode(range) abort
    let l:prompt = "optimize the following code for performance and readability"
    let l:config = {
        \ "options": {
        \   "initial_prompt": ">>> system\nyou are a senior software engineer",
        \   "temperature": 0.7,
        \ },
        \}
    if a:range
        '<,'>call vim_ai#AIChatRun(1, l:config, l:prompt)
    else
        %call vim_ai#AIChatRun(1, l:config, l:prompt)
    endif
endfunction
```

然后在配置中注册：
```vim
" 在 cvimrc.vim 中添加
let g:cvim_custom_prompts = {
    \ 'OptimizeCode': '优化代码性能和可读性',
    \ }
```

### 配置选项详解

#### 1. 模型配置
```vim
" 使用 OpenAI
let g:cv_vim_ai_config.complete.model = 'gpt-4'
let g:cv_vim_ai_config.complete.endpoint_url = 'https://api.openai.com/v1/chat/completions'

" 使用 Ollama（本地运行）
let g:cv_vim_ai_config.complete.model = 'codellama'
let g:cv_vim_ai_config.complete.endpoint_url = 'http://localhost:11434/v1/chat/completions'

" 使用 Azure OpenAI
let g:cv_vim_ai_config.complete.model = 'gpt-4'
let g:cv_vim_ai_config.complete.endpoint_url = 'https://your-resource.openai.azure.com/openai/deployments/your-deployment/chat/completions?api-version=2023-05-15'
```

#### 2. 参数调优
```vim
" 温度设置（0-2，越高越随机）
let g:cv_vim_ai_config.complete.temperature = 0.1    " 代码补全：低温度，更确定
let g:cv_vim_ai_config.chat.temperature = 1.0       " 聊天：中等温度，更有创造性

" Token 限制
let g:cv_vim_ai_config.complete.max_tokens = 1000   " 最大生成 token 数
let g:cv_vim_ai_config.complete.max_completion_tokens = 200  " 最大补全 token 数

" 超时设置
let g:cv_vim_ai_config.complete.request_timeout = 30  " 请求超时（秒）

" 流式输出
let g:cv_vim_ai_config.complete.stream = 1          " 启用流式输出
```

#### 3. UI 配置
```vim
" 聊天窗口配置
let g:cv_vim_ai_config.chat.ui = {
    \ "code_syntax_enabled": 1,      " 启用代码语法高亮
    \ "populate_options": 0,         " 不自动填充选项
    \ "open_chat_command": "preset_below",
    \ "scratch_buffer_keep_open": 0, " 不保持暂存缓冲区打开
    \ "paste_mode": 1,               " 启用粘贴模式
    \ }
```

### 高级功能

#### 1. 上下文管理
```vim
" 添加上下文到聊天
:AIChat --context "项目使用 React 和 TypeScript"

" 在编辑时提供上下文
:AIAEdit --context "这是用户认证模块" "重构这段代码"
```

#### 2. 批量处理
```vim
" 批量编辑多个文件
:argdo AIAEdit "添加错误处理"

" 在项目中搜索并替换
:vimgrep /TODO/ **/*.py
:cdo AIAEdit "实现 TODO 注释中的功能"
```

#### 3. 集成工作流
```vim
" 代码审查工作流
1. 选中代码
2. :'<,'>AIPrompt CodeReview
3. 根据建议修改代码
4. :AIAEdit "应用审查建议"

" 文档生成工作流
1. 选中函数
2. :'<,'>AIAEdit "生成文档字符串"
3. 调整生成的文档
```

### 故障排除

#### 1. 连接问题
```bash
# 测试 API 连接
curl -X POST https://api.deepseek.com/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -d '{"model":"deepseek-chat","messages":[{"role":"user","content":"Hello"}]}'
```

#### 2. 配置检查
```vim
" 检查当前配置
:echo g:cv_vim_ai_config

" 检查 token 文件
:echo readfile(g:cv_vim_ai_config.token_file)

" 测试连接
:AIChat "测试连接"
```

#### 3. 性能优化
```vim
" 减少上下文长度
let g:cv_vim_ai_config.complete.max_tokens = 500

" 禁用流式输出（减少内存使用）
let g:cv_vim_ai_config.complete.stream = 0

" 使用更小的模型
let g:cv_vim_ai_config.complete.model = 'deepseek-coder-1.3b'
```

#### 4. 常见错误
- **"Invalid API key"**: 检查 token 文件内容和权限
- **"Connection refused"**: 检查网络和端点 URL
- **"Model not found"**: 检查模型名称是否正确
- **"Rate limit exceeded"**: 降低请求频率或升级 API 套餐

### 最佳实践

1. **分阶段使用**：
   - 先用 AI 生成代码框架
   - 然后人工优化和调整
   - 最后进行代码审查

2. **提供清晰上下文**：
   - 在提示中说明技术栈
   - 提供相关代码片段
   - 明确需求和约束条件

3. **验证输出**：
   - 始终审查 AI 生成的代码
   - 运行测试确保功能正常
   - 检查安全性和性能影响

4. **成本控制**：
   - 设置使用限额
   - 优先使用本地模型（如 Ollama）
   - 缓存常用结果

---

## 插件对比与选择建议

| 特性 | Codeium | Vim-AI |
|------|---------|--------|
| **价格** | 免费 | 依赖后端（有免费选项） |
| **安装复杂度** | 简单 | 中等 |
| **配置灵活性** | 有限 | 高 |
| **功能范围** | 代码补全为主 | 补全、编辑、聊天、自定义提示 |
| **自定义能力** | 低 | 高 |
| **本地运行** | 不支持 | 支持（通过 Ollama） |
| **多后端支持** | 仅 Codeium | OpenAI、DeepSeek、Ollama 等 |

### 选择建议

#### 选择 Codeium 如果：
- 需要简单易用的代码补全
- 不想配置 API 密钥
- 预算有限（免费）
- 主要需求是代码自动完成

#### 选择 Vim-AI 如果：
- 需要更多功能（编辑、聊天、自定义提示）
- 希望使用特定 AI 模型（GPT-4、Claude 等）
- 需要本地运行（隐私考虑）
- 有自定义工作流需求
- 愿意进行更多配置

### 混合使用方案
可以在不同场景使用不同插件：
```vim
" 根据文件类型切换
function! SelectAIAssistant()
    if &filetype =~ 'python\|javascript\|go'
        " 代码文件使用 Codeium
        let g:cv_ai_assistant_plugin = 'codeium'
    else
        " 文档和其他文件使用 Vim-AI
        let g:cv_ai_assistant_plugin = 'vim-ai'
    endif
endfunction

autocmd BufEnter * call SelectAIAssistant()
```

### 迁移指南
从 Codeium 迁移到 Vim-AI：
1. 备份当前配置
2. 更新 `cvimrc.vim` 中的插件设置
3. 配置 API 密钥和端点
4. 重新映射快捷键
5. 测试基本功能

从 Vim-AI 迁移到 Codeium：
1. 注释掉 Vim-AI 配置
2. 启用 Codeium 配置
3. 设置环境变量
4. 运行 `:PluginInstall`
5. 测试补全功能

---

## 安全注意事项

### API 密钥安全
1. **不要提交密钥到版本控制**：
   ```bash
   # 在 .gitignore 中添加
   .cvim/cvimrc.vim
   ~/.config/*.token
   ```

2. **使用环境变量**：
   ```bash
   # 而不是硬编码在配置文件中
   export DEEPSEEK_API_KEY="your-key"
   ```

3. **定期轮换密钥**：
   - 每月更新一次 API 密钥
   - 使用密钥管理服务

### 代码安全
1. **审查 AI 生成的代码**：
   - 检查安全漏洞
   - 验证依赖项
   - 测试边界条件

2. **避免敏感信息**：
   - 不要向 AI 发送密钥、密码
   - 脱敏处理业务数据
   - 使用本地模型处理敏感代码

### 隐私保护
1. **使用本地模型**（如 Ollama）处理敏感项目
2. **检查服务条款**，了解数据使用政策
3. **启用匿名化**（如果服务支持）

---

## 性能优化

### 通用优化
```vim
" 减少自动触发频率
let g:codeium_idle_delay = 200
let g:cv_vim_ai_config.complete.max_tokens = 300

" 限制上下文长度
set synmaxcol=500  " 限制语法高亮列数

" 禁用不需要的文件类型
let g:codeium_filetypes = {
    \ "gitcommit": v:false

>>> user


