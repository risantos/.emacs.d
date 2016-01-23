##  My Emacs Configuration

**Working in:**
* GNU Emacs 24.5.1 (x86_64-pc-linux-gnu, GTK+ Version 3.16.6)


### Dependencies

For the configuration to work properly, some external dependencies are required, such as:

vcs: `git` , `mercurial` , `bzr` , `cvs`

build tools: `gnulib`, `autogen`

$\LaTeX$: `texlive`, `texinfo` 

Python: `python3`, python3-# packages, where # = pip, numpy, scipy, matplotlib, pandas, simpy, nose.

from `pip3`:  ipython[all], jupyter, jedi, epc, pylint, tornado, flake8, autopep8
Also to regularly update my Python packages.


### Emacs plugins used

**Bundled with Emacs**
* `org-mode` -- [Note keeper, Organizer, Planner](http://orgmode.org/)
* `ido` -- [Interactively Do Things](http://www.emacswiki.org/emacs/InteractivelyDoThings)
* `python.el` -- Python-mode built in Emacs >24.1


**Others**
Other plugins are installed using
[`el-get`](https://github.com/dimitri/el-get).

The list of plugins from el-get is in `.emacs.d/settings/el-get-settings.el`, which are:

* `auctex` -- [$\TeX$ extensible package](https://www.gnu.org/software/auctex/)
* `auto-complete` -- [Emacs auto completion](https://github.com/auto-complete/auto-complete)
* `color-theme-solarized` -- [solarized color theme](http://ethanschoonover.com/solarized) color theme
* `ein` -- [Emacs IPython Notebook](https://github.com/millejoh/emacs-ipython-notebook)
* `gnuplot-mode` -- [gnuplot Emacs integration](https://github.com/bruceravel/gnuplot-mode)
* `helm` -- [completion and selection](https://github.com/emacs-helm/helm) narrowing framework
* `helm-descbinds` -- describe keybindings using helm
* `helm-pydoc` -- [pydoc using helm](https://github.com/syohex/emacs-helm-pydoc)
* `jedi` -- [Python auto-completion package for Emacs](http://tkf.github.io/emacs-jedi/latest/)
* `js2-mode` -- [Javascript mode](http://www.emacswiki.org/emacs/Js2Mode)
* `latex-preview-pane` -- PDFLaTeX preview in buffer 
* `magit` -- [Git Porcelain in Emacs](https://github.com/magit/magit)
* `markdown-mode` -- [Markdown support](http://daringfireball.net/projects/markdown/) files
* `multiple-cursors` -- editing with [Multiple cursors](https://github.com/magnars/multiple-cursors.el)
* `popup` -- [visual popup for auto completion](https://github.com/auto-complete/popup-el)
* `pydoc-info` -- [Python documentation](https://bitbucket.org/jonwaltman/pydoc-info/)
* `yasnippet` -- [Template system for Emacs](https://github.com/capitaomorte/yasnippet)
* `yaml-mode` -- support [YAML](https://github.com/yoshiki/yaml-mode) files
