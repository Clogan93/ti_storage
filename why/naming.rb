___app/assets/javascripts/components?
  that's a folder for React components, its code is called from views with <%= react_component %>.
  there is no `import`s within our current asset pipeline (and it's a headache to be fixing it), so everything's in the global scope. So we need some naming conventions.
  
  /pages contains noncommon, page/layout-specific layouts.

  /pages/header/DropdownMenus/index.js
  if folder name is capitalized - there is an index.js in it, that containes eg Header_DropdownMenus component.


  /pages/header/DropdownMenus/dropdowns/
  if not - there is no index.js in it. so /dropdowns is not a folder for the contents of some element, it's just a namespace for a few similar partials of /pages/header/DropdownMenus/index.js.

  page: /pages/header/DropdownMenus/index.js
  component: Header_DropdownMenus

  page: /pages/header/DropdownMenus/dropdowns/StorageSolutions.js
  component: Header_DropdownMenus_dropdowns_StorageSolutions

  page: /pages/header/DropdownMenus/dropdowns/Storages/index.js
  component: Header_DropdownMenus_dropdowns_Storages

  page: /pages/header/DropdownMenus/dropdowns/Storages/Storage.js
  component: Header_DropdownMenus_dropdowns_Storages_Storage


  If something's called otherwise somewhere - consider renaming a TODO.


___app/assets/images?
  all folders are kept in consistence with app/views, except for those starting with _:
  _common: we keep images common across views here. or images that look reusable.
  _db: we replicate eg carrierwave here (_db/model_name/record_id)
