# Easy Data
A Love2D library for easily saving and loading data.

## Usage
Get the `easyData.lua` file and place it at your desired location.
Require the library as following:

```
local easyData = require('path.to.easyData');
#or
require "path.to.easyData"
```
## Documentation

- The library exposes two methods: `save` and `load`.
- It saves the data in default save location of LOVE2D.
- The save type of file is `sav`, though you can read it as any other text file.
- The text is also converted to hex, just for coolness. ;-)

### `easyData.save`

> CAUTION: Only strings, numbers and booleans are supported. Every other data type is simply ignored. This means that nested tables are also ignored. Consider using a table flattener.

As the name suggests, this method is used to save the supplied table. The given Id is the filename of save. You can save multiple tables separately if you want.

- Arguments 
  - `id`: String Id of data to be saved
  - `table`: The table to be saved.
- Returns `nil` 

### `easyData.load`

This method is used to read the saved file.

- Arguments
  - `id`: String Id of data to be read.
- Returns `table`

## Notes

It may be that the last commit is a long time back. Don't worry, the library works as expected and as there is not a lot of fancy things to maintain, this is expected.

## License

The library is licensed under the MIT License. A copy of the license can be found in this repository.
