{% include 'partials/flash-banner.volt' %}

<div class="clearfix">
    <div class="col-lg-9 center-block">
        <div class="panel panel-default">
            <div class="panel-heading">Categories</div>

            <table class="table">
                <thead>
                <tr>
                    <th>#</th>
                    <th class="col-lg-9">Category Name</th>
                    <th></th>
                    <th>Last Message</th>
                </tr>
                </thead>
                <tbody>
                {%- for category in categories -%}
                    <tr>
                        <td>
                            {%  if config.theme.use_topics_icon %}
                                {%- if logged -%}
                                    {% set not_read_category = not_read[category.id] %}

                                    {%- if not_read_category > 0 -%}
                                        {{ image(config.theme.active_topic_icon, "class": "img-rounded") }}
                                    {%- else -%}
                                        {{ image(config.theme.inactive_topic_icon, "class": "img-rounded") }}
                                    {%- endif -%}
                                {%- else -%}
                                    {{ image(config.theme.inactive_topic_icon, "class": "img-rounded") }}
                                {%- endif -%}
                            {%- endif -%}
                        </td>
                        <td>
                            {{ link_to(category.getUrl(), category.name) }}
                            <br><small>{{ category.description }}</small>
                        </td>
                        <td>
                            {{ posts_per_category[category.id] }} Threads
                        </td>
                        <td>
                            {%- if posts_per_category[category.id] > 0 -%}
                                {%  set last_post = last_author[category.id][0] %}
                                {{ link_to('discussion/' ~ last_post.post1_id ~ '/' ~ last_post.post1_slug, last_post.post1_title) }}
                                <br> {{ last_post.name_user }}
                            {%- else -%}
                                ---
                            {%- endif -%}
                        </td>
                    </tr>
                {%- endfor -%}
                </tbody>
            </table>
        </div>
    </div>
</div>
