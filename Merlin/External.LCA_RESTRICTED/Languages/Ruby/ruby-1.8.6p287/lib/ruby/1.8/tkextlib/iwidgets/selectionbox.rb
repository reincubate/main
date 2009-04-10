#
#  tkextlib/iwidgets/selectionbox.rb
#                               by Hidetoshi NAGAI (nagai@ai.kyutech.ac.jp)
#

require 'tk'
require 'tkextlib/iwidgets.rb'

module Tk
  module Iwidgets
    class Selectionbox < Tk::Itk::Widget
    end
  end
end

class Tk::Iwidgets::Selectionbox
  TkCommandNames = ['::iwidgets::selectionbox'.freeze].freeze
  WidgetClassName = 'Selectionbox'.freeze
  WidgetClassNames[WidgetClassName] = self

  def __boolval_optkeys
    super() << 'itemson' << 'selectionon'
  end
  private :__boolval_optkeys

  def __strval_optkeys
    super() << 'itemslabel' << 'selectionlabel'
  end
  private :__strval_optkeys

  def child_site
    window(tk_call(@path, 'childsite'))
  end

  def clear_items
    tk_call(@path, 'clear', 'items')
    self
  end

  def clear_selection
    tk_call(@path, 'clear', 'selection')
    self
  end

  def get
    tk_call(@path, 'get')
  end

  def insert_items(idx, *args)
    tk_call(@path, 'insert', 'items', idx, *args)
  end

  def insert_selection(pos, text)
    tk_call(@path, 'insert', 'selection', pos, text)
  end

  def select_item
    tk_call(@path, 'selectitem')
    self
  end

  # based on TkListbox ( and TkTextWin )
  def curselection
    list(tk_send_without_enc('curselection'))
  end
  def delete(first, last=None)
    tk_send_without_enc('delete', first, last)
    self
  end
  def index(idx)
    tk_send_without_enc('index', idx).to_i
  end
  def nearest(y)
    tk_send_without_enc('nearest', y).to_i
  end
  def scan_mark(x, y)
    tk_send_without_enc('scan', 'mark', x, y)
    self
  end
  def scan_dragto(x, y)
    tk_send_without_enc('scan', 'dragto', x, y)
    self
  end
  def selection_anchor(index)
    tk_send_without_enc('selection', 'anchor', index)
    self
  end
  def selection_clear(first, last=None)
    tk_send_without_enc('selection', 'clear', first, last)
    self
  end
  def selection_includes(index)
    bool(tk_send_without_enc('selection', 'includes', index))
  end
  def selection_set(first, last=None)
    tk_send_without_enc('selection', 'set', first, last)
    self
  end
  def size
    tk_send_without_enc('size').to_i
  end
end