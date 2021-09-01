### pandas 复制

python 默认的是浅拷贝。

DataFrame 有两种复制操作，一种是 `=`,  另一种是`DataFrame.copy()`。

`DataFrame.copy(deep=True)` 是默认的深拷贝操作。

[官方文档](https://github.com/pandas-dev/pandas/blob/v1.2.3/pandas/core/generic.py#L5889-L5997)



### pandas to_excel

有样式的写入 xlsx

```python
def save_xlsx(out_put_filename, result_dict):
    writer = pd.ExcelWriter(out_put_filename, engine='xlsxwriter')
    workbook = writer.book
    for key, val in result_dict.items():
        print(key)
        df = pd.DataFrame(val)
        df.to_excel(writer, sheet_name=key)
        worksheet = writer.sheets[key]
        cell_format = workbook.add_format()
        cell_format.set_text_wrap()
        cell_format.set_align("top")
        worksheet.set_column("B:Z", 25, cell_format)
        worksheet.set_default_row(18)
    writer.save()
```
