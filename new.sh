#!/usr/bin/env bash
# 创建新 package

github_repository_url="https://github.com/qvgz/golib/tree/master"

while true ; do
  read -rp "package 名称：" package_name
  if [[ ! -d $package_name ]] ; then
    break;
  fi
  echo -e "重新输入 $package_name 该 package 以存在!\n"
done


read -rp "package 信息：" intro

content="// $intro
package $package_name

"

# 创建目录与文件
(mkdir ./$package_name && cd $package_name && \
echo -e "$content" > ./${package_name}.go
echo -e "$content" > ./${package_name}_test.go
echo -e "# ${package_name} \n ${intro}\n\n## 实现\n- [ ]"> ./README.md
touch ./ignore-note)

echo -e "| [${package_name}](${github_repository_url}/${package_name}) | ${intro} |"  >> ./README.md




