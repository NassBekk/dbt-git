{% macro auto_test(number) %}
    insert into DBT_DB.PUBLIC.MY_FIRST_DBT_MODEL values({{number}});
    commit; -- Cette commande sert à valider l'insertion de la ligne sur la table 
{% endmacro %}
