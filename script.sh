while read -r line
do
    role=$(echo $line|cut -d " " -f1)
    echo "Processing $role"
    if [[ "$role" =~ ^[A-Z] ]]; then
      echo "ignoring $role"
    else
      oc get clusterrole $role -o json| jq .aggregationRule
    fi
done < <(oc get clusterrole)
