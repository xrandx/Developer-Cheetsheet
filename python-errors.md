## pandas

Workbook corruption: seen[2] == 4

据说是 xlrd 不再支持 xls

修改 `Python\lib\site-packages\xlrd\compdoc.py`

注释掉 `raise CompDocError("%s corruption: seen[%d] == %d" % (qname, s, self.seen[s]))`

