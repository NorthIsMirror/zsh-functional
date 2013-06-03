docsRecursionLevel=0
metaName="$(dirname $0)/__init-$(basename $0)"
initDocs=$(cat $metaName)
metaName="$(dirname $0)/__done-$(basename $0)"
doneDocs=$(cat $metaName)
